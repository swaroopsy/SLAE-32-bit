print 'Enter 8 characters string:'

code = raw_input()

rev=code[::-1]

encode=rev.encode('hex')

print encode

