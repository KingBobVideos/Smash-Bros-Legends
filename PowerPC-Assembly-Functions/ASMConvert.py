#destFile = input('Enter file name: ')
destFile = "CodeMenu.asm"
source = "ASM.txt"

with open(source, 'r') as file:
    text = file.read()
    lines = []
    for i in range(0, len(text), 16):
        lines.append(text[i:i+8] + ' ' + text[i+8:i+16])

result = '* ' + '\n* '.join(lines)

with open(destFile, 'w') as file:
    file.write(result)