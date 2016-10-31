import time
import os
import sys 
from simplecrypt import encrypt
from simplecrypt import decrypt

 
def main():
  input_filename = sys.argv[1] # filename passed in the command line
  _type = sys.argv[2] #  passed in the command line'encrypt' or 'decrypt'
  
  if _type == "encrypt":
    output_filename = "{}.encrypted".format(input_filename)
  
  elif _type == "decrypt":
    output_filename = "{}.decrypted".format(input_filename)

  key = 'strong_key'
  
  if not os.path.exists(input_filename):
    print 'The file {} does not exist. Quitting...'.format(input_filename)
    sys.exit()

  if os.path.exists(output_filename):
    print 'This will overwrite the file {}. (C)ontinue or (Q)uit?'.format(output_filename)
    response = input('> ')
    if not response.lower().startswith('c'):
      sys.exit()

  file_object = open(input_filename)
  content = file_object.read()
  file_object.close()

  print '{}ing...'.format(_type.title())

  # Measure how long the encryption/decryption takes.
  start_time = time.time()
  if _type == 'encrypt':
     translated = encrypt(key, content)
  elif _type == 'decrypt':
     translated = decrypt(key, content).decode('utf8')
  total_time = round(time.time() - start_time, 2)
  print '{}ion time: {} seconds'.format(_type.title(), total_time)

  # Write out the translated message to the output file.
  output_file_object = open(output_filename, 'w')
  output_file_object.write(translated)
  output_file_object.close()

  print 'Done {}ing {} ({} characters).'.format(_type, input_filename, len(content))
  print '{}ed file is {}.'.format(_type.title(), output_filename)

if __name__ == '__main__':
  main()