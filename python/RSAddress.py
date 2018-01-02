# Copyright (c) 2017 Jake B.

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

# Converted to python from: 
#  https://github.com/BurstProject/burstcoin/blob/efaf44781b0f5101a86356571f90c8a56652a1e5/html/ui/js/util/nxtaddress.js
# Original code in public domain

import math

#from https://stackoverflow.com/questions/22747092/valueerror-substring-not-found-what-am-i-doing-wrong
def set_list(l, i, v):
      try:
          l[i] = v
      except IndexError:
          for _ in range(i-len(l)+1):
              l.append(None)
          l[i] = v

class RSAddress:
	codeword = [1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0];
	syndrome = [0, 0, 0, 0, 0];

	gexp = [1, 2, 4, 8, 16, 5, 10, 20, 13, 26, 17, 7, 14, 28, 29, 31, 27, 19, 3, 6, 12, 24, 21, 15, 30, 25, 23, 11, 22, 9, 18, 1];
	glog = [0, 0, 1, 18, 2, 5, 19, 11, 3, 29, 6, 27, 20, 8, 12, 23, 4, 10, 30, 17, 7, 22, 28, 26, 21, 25, 9, 16, 13, 14, 24, 15];

	cwmap = [3, 2, 1, 0, 7, 6, 5, 4, 13, 14, 15, 16, 12, 8, 9, 10, 11];

	alphabet = '23456789ABCDEFGHJKLMNPQRSTUVWXYZ';

	guess = []

	prefix = None

	def __init__(self, addressPrefix):
		self.prefix = addressPrefix

	def ginv(self, a):
		return self.gexp[31 - self.glog[a]]

	def gmult(self, a, b):
		if (a == 0 or b == 0):
			return 0;

		idx = (self.glog[a] + self.glog[b]) % 31
		return self.gexp[idx]

	def calc_discrepancy(self, lam, r):
		discr = 0;

		for i in range(0, r):
			discr ^= self.gmult(lam[i], self.syndrome[r - i]);

		return discr

	def find_errors(self, lam):
		errloc = []

		for i in range(1, 31+1):
			sum = 0

			for j in range(0, 5):
				sum ^= self.gmult(self.gexp[(j * i) % 31], lam[j])

				if (sum == 0):
					pos = 31 - i
					if (pos > 12 and pos < 27):
						return []

					errloc.append(pos);

		return errloc;

	def guess_errors(self):
		el = 0
		b = [0, 0, 0, 0, 0]
		t = []

		deg_lambda = 0,
		lamb = [1, 0, 0, 0, 0] # error+erasure locator poly

		# Berlekamp-Massey algorithm to determine error+erasure locator polynomial

		for r in range(0, 4):
			discr = self.calc_discrepancy(lamb, r + 1); # Compute discrepancy at the r-th step in poly-form

			if (discr != 0):
				deg_lambda = 0

				for i in range(0, 5):
					t.append(lamb[i] ^ self.gmult(discr, b[i]))

					if (t[i]):
						deg_lambda = i

				if (2 * el <= r):
					el = r + 1 - el

					for i in range(0, 5):
						b[i] = self.gmult(lamb[i], self.ginv(discr))

				lamb = t[:]

			b.insert(0,0)

		# Find roots of the locator polynomial.

		errloc = self.find_errors(lamb)

		errors = len(errloc)

		if (errors < 1 or errors > 2):
			return None

		if (deg_lambda != errors): 
			return None # deg(lambda) unequal to number of roots => uncorrectable error

		# Compute err+eras evaluator poly omega(x) = s(x)*lambda(x) (modulo x**(4)). Also find deg(omega).

		omega = [0, 0, 0, 0, 0]

		for i in range(0, 4):
			t = 0;

			for j in rnage(0, i):
				t ^= gmult(syndrome[i + 1 - j], lamb[j])

			omega[i] = t

		# Compute error values in poly-form.

		for r in (0, errors):
			t = 0
			pos = errloc[r]
			root = 31 - pos

			for i in range(0, 4):  # evaluate Omega at alpha^(-i)
				t ^= gmult(omega[i], gexp[(root * i) % 31])

			if (t): # evaluate Lambda' (derivative) at alpha^(-i); all odd powers disappear
				denom = gmult(lamb[1], 1) ^ gmult(lamb[3], gexp[(root * 2) % 31])

				if (denom == 0):
					return None

				if (pos > 12):
					pos -= 14

				self.codeword[pos] ^= gmult(t, ginv(denom))
			
		return True

	def encode(self):
		p = [0, 0, 0, 0];

		for i in range(12, -1, -1):
			fb = self.codeword[i] ^ p[3]

			p[3] = p[2] ^ self.gmult(30, fb)
			p[2] = p[1] ^ self.gmult(6, fb)
			p[1] = p[0] ^ self.gmult(9, fb)
			p[0] = self.gmult(17, fb)

		self.codeword[13] = p[0]
		self.codeword[14] = p[1]
		self.codeword[15] = p[2]
		self.codeword[16] = p[3]

	def reset(self):
		for i in range(0,17):
			self.codeword[i] = 1

	def set_codeword(self, cw, length=17, skip=-1):

		j = 0;
		for i in range(0, length):
			if (i != skip):
				self.codeword[self.cwmap[j]] = cw[i];
				j+=1


	def add_guess(self):
		s = self.toString()
		length = len(self.guess)

		if (length > 2):
			return

		for i in range(0,length):
			if (self.guess[i] == s):
				return;

		self.guess.append(s);

	def ok(self):
		sum = 0;

		for i in range(1, 5):
			t=0
			for j in range(0, 31):
				if (j > 12 and j < 27):
					continue

				pos = j;

				if (j > 26):
					pos -= 14;

				t ^= self.gmult(self.codeword[pos], self.gexp[(i * j) % 31]);

			sum |= t
			self.syndrome[i] = t;

		return (sum == 0);

	def from_acc(self, acc):
		inp = []
		out = []
		pos = 0
		length = len(acc)

		if (length == 20 and acc[0] != '1'):
			return None

		for i in range(0, length):
			inp.append(ord(acc[i]) - ord('0'))

		while True:
			divide = 0
			newlen = 0

			for i in range(0, length):
				divide = divide * 10 + inp[i];

				if (divide >= 32):
					inp[newlen] = divide >> 5;
					newlen+=1
					divide &= 31;
				elif (newlen > 0):
					inp[newlen] = 0;
					newlen+=1

			length = newlen;
			out.append(divide);
			pos+=1

			if (newlen == 0):
				break

		for i in range(0, 13):  # copy to codeword in reverse, pad with 0's
			pos-=1
			self.codeword[i] = out[i] if (pos >= 0) else 0

		self.encode()

		return True

	def toString(self):
		out = self.prefix + '-';

		for i in range(0,17):
			out += self.alphabet[self.codeword[self.cwmap[i]]];
			if ((i & 3) == 3 and i < 13):
				out += '-'

		return out

	def account_id(self):
		out = ''
		inp = []
		length = 13

		for i in range(0, 13):
			inp.append(self.codeword[12 - i])

		while True:
			divide = 0
			newlen = 0

			for i in range(0,length):
				divide = divide * 32 + inp[i];

				if (divide >= 10):
					inp[newlen] = int(math.floor(divide / 10))
					newlen+=1
					divide %= 10
				elif (newlen > 0):
					inp[newlen] = 0
					newlen+=1

			length = newlen
			out += chr(int(divide) + ord('0'));

			if (newlen==0):
				break

		#return out.split("").reverse().join("");
		return out[::-1]

	def set(self, adr, allow_accounts = True):

		length = 0
		self.guess = []
		self.reset()

		adr = str(adr)
		adr = adr.strip().upper()

		if (adr.startswith('BURST-')):
			adr = adr[6:]

		if (unicode(adr, 'utf-8').isnumeric()):
			if (allow_accounts):
				return self.from_acc(adr);
		else:
			clean = []

			for i in range(0, len(adr)):
				try: 
					pos = self.alphabet.index(adr[i]);
				except ValueError:
					pos = -1

				if (pos >= 0):	
					clean.append(pos)
					length+=1
					if (length> 18):
						return None
				
		if (length == 16): # // guess deletion
			for i in range(16, -1, -1):
				for j in range(0, 32):
					set_list(clean, i, j)

					self.set_codeword(clean);

					if (self.ok()):
						self.add_guess();

				if (i > 0):
					t = clean[i - 1]
					clean[i - 1] = clean[i]
					clean[i] = t

		if (length == 18): # // guess insertion
			for i in range(0, 18):
				set_codeword(clean, 18, i);

				if (this.ok()):
					self.add_guess();

		if (length == 17):
			self.set_codeword(clean);

			if (self.ok()):
				return True;

			if (self.guess_errors() and self.ok()):
				self.add_guess();

		self.reset();

		return None

	def format_guess(self, s, org):
		d = ''
		list = []

		s = s.upper();
		org = org.upper();

		i = 0
		while True:
			if not i < len(s):
				break;
		
			m = 0;

			for j in range(1, len(s)):
				pos = org.index(s.index(i, j));

				if (pos != -1):
					if (abs(pos - i) < 3):
					 m = j;
				else:
					break

			if (m):
				list.append({
					's': i,
					'e': i + m
				})
				i += m;
			else:
				i+=1;

		if (len(list) == 0):
			return s;

		j = 0
		for i in range(0, len(s)):
			if (i >= list[j].e):
				start;

				while (j < len(list) - 1):
					start = list[j].s
					j += 1

					if (i < list[j].e or list[j].s >= start):
						break;
			if (i >= list[j].s and i < list[j].e):
				d += s[i];
			else:
				d += '<b style="color:red">' + s.charAt(i) + '</b>';

		return d;

if __name__ == "__main__":
	test_cases = [("BURST-UV6Y-2CMW-QM7Y-DBS9B", "13015131355133865118"),
				  ("13015131355133865118", "BURST-UV6Y-2CMW-QM7Y-DBS9B"),
				  ("BURST-5LM8-3VFQ-WTLJ-7FCQ8",  "6005916304280767078"),
				  ("6005916304280767078", "BURST-5LM8-3VFQ-WTLJ-7FCQ8"),
				  ("BURST-CA9X-RC5H-5YMQ-77Z8V",  "6745237456208339197"),
				  ("6745237456208339197", "BURST-CA9X-RC5H-5YMQ-77Z8V"),
				  ("BURST-CA9X-RC5H-5YM*-77Z8V",  "6745237456208339197"),
				  ("BURST-YA3R-RLP6-H3NJ-ARGZY",  "10339657524823662647"),
				  ("10339657524823662647", "BURST-YA3R-RLP6-H3NJ-ARGZY")]
	
	x = RSAddress("BURST")

	for test_pair in test_cases:
		if not x.set(test_pair[0]):
			print("SETFAIL: ", test_pair[0], " -> ", test_pair[1])

		if test_pair[0].isnumeric():
			if x.toString() == test_pair[1]:
				print("SUCCESS: ", test_pair[0], " -> ", test_pair[1])
			else:
				print("FAIL:    ", test_pair[0], " -> ", x.toString(), " expected: ", test_pair[1])
		else:
			if x.account_id() == test_pair[1]:
				print("SUCCESS: ", test_pair[0], " -> ", test_pair[1])
			else:
				print("FAIL:    ", test_pair[0], " -> ", x.account_id(), " expected: ", test_pair[1])



