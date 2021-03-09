# strings in x86 ASM

## How to run the tests:

```bash
make
./checker
```

## About
https://ocw.cs.pub.ro/courses/iocla/teme/tema-2

## Structure

### 1.OTP:

For every character of the both strings - plaintext string and key string, I
moved the character in a 1 byte register and then performed xor operation on
them. After this, I moved the result to the ciphertext address and looped.

### 2. CAESAR:

For every character of the plaintext string, I moved it to a 1 byte register and
checked whether it is a small letter, a capital letter or just other characters
that don't need conversion. After checking its type, I performed the encryption
for each case - small or capital letter and then moved the result to the
ciphertext address and looped.

### 3. VIGENERE:

For this task I used 3 global variables called:

- countPlain for iterating through the plaintext string until countPlain reached
the length of plaintext.

- countKey for iterating through the key until countKey reached the length of
keylength and then going back to 0 to perform the extended key.

- lenKey for storing the length of key so I can use the ebx register freely.

For every character of the both strings - plaintext string and extended key
string, I moved the character in a 1 byte register and checked whether it is a
small letter, a capital letter or just other characters that don't need
conversion. After checking its type, I performed the encryption for each case
- small or capital letter and then moved the result to the ciphertext address
and looped.

### 4. MY_STRSTR:

For this task I used 3 global variables called:

-isValid for checking if all characters from the substring match the characters
in the string. If isValid equals to the length - 1 of the substring, then all
characters match.

-count for iterating through the string until its end.

-index to save the index of the first occurence of the substring and return it.

For every character in the string, I checked if it is equal to the first
character in the substring. If it is, then I save the index and check the other
remaining characters in the substring with the next length - 1 of substring
characters in the string. At the end, if the isValid variable equals the length
- 1 of the substring then all characters were matched and we return the index.
If not and it failed, it is returned the string length + 1.

## Project structure

```bash
├── bin_to_hex.asm
├── caesar.asm
├── checker
├── checker.c
├── checker.h
├── input
│   ├── bintohex0_in
│   ├── bintohex1_in
│   ├── bintohex2_in
│   ├── bintohex3_in
│   ├── bintohex4_in
│   ├── caesar0_in
│   ├── caesar1_in
│   ├── caesar2_in
│   ├── caesar3_in
│   ├── caesar4_in
│   ├── otp0_in
│   ├── otp1_in
│   ├── otp2_in
│   ├── otp3_in
│   ├── otp4_in
│   ├── strstr0_in
│   ├── strstr1_in
│   ├── strstr2_in
│   ├── strstr3_in
│   ├── strstr4_in
│   ├── vigenere0_in
│   ├── vigenere1_in
│   ├── vigenere2_in
│   ├── vigenere3_in
│   └── vigenere4_in
├── io.mac
├── Makefile
├── Makefile.checker
├── my_strstr.asm
├── otp.asm
├── output
│   ├── bintohex0_out
│   ├── bintohex1_out
│   ├── bintohex2_out
│   ├── bintohex3_out
│   ├── bintohex4_out
│   ├── caesar0_out
│   ├── caesar1_out
│   ├── caesar2_out
│   ├── caesar3_out
│   ├── caesar4_out
│   ├── otp0_out
│   ├── otp1_out
│   ├── otp2_out
│   ├── otp3_out
│   ├── otp4_out
│   ├── strstr0_out
│   ├── strstr1_out
│   ├── strstr2_out
│   ├── strstr3_out
│   ├── strstr4_out
│   ├── vigenere0_out
│   ├── vigenere1_out
│   ├── vigenere2_out
│   ├── vigenere3_out
│   └── vigenere4_out
├── README.md
├── ref
│   ├── bintohex0_ref
│   ├── bintohex1_ref
│   ├── bintohex2_ref
│   ├── bintohex3_ref
│   ├── bintohex4_ref
│   ├── caesar0_ref
│   ├── caesar1_ref
│   ├── caesar2_ref
│   ├── caesar3_ref
│   ├── caesar4_ref
│   ├── otp0_ref
│   ├── otp1_ref
│   ├── otp2_ref
│   ├── otp3_ref
│   ├── otp4_ref
│   ├── strstr0_ref
│   ├── strstr1_ref
│   ├── strstr2_ref
│   ├── strstr3_ref
│   ├── strstr4_ref
│   ├── vigenere0_ref
│   ├── vigenere1_ref
│   ├── vigenere2_ref
│   ├── vigenere3_ref
│   └── vigenere4_ref
└── vigenere.asm

```