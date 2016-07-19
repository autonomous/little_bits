import freetype
import json
import sys

language = sys.argv[1]
text = sys.argv[2]

size = 65
face = freetype.Face('Arial Unicode.ttf')
face.set_char_size( 50*64 )
slot = face.glyph

# First pass to compute bbox
width, height, baseline = 0, 0, 0
for i,c in enumerate(text):
    if c.isalpha():
        face.load_char(c)
        bitmap = slot.bitmap
        height = max(height,
                     bitmap.rows + max(0,-(slot.bitmap_top-bitmap.rows)))
        baseline = max(baseline, max(0,-(slot.bitmap_top-bitmap.rows)))
        width = max(width, bitmap.width)

# Initialize our arrays
pixel_letters = []
pixel_color = []
letters_count = {}
for i in range(size*size):
    pixel_color.append(0)
    pixel_letters.append([])

x,y = 0,0
for char in text:
    if char.isalpha():

        face.load_char(char)
        bitmap = slot.bitmap

        top = slot.bitmap_top
        left = slot.bitmap_left
        w,h = bitmap.width, bitmap.rows
        y = height-baseline-top

        # Add margin to center all letters in square
        i = 1
        row = y
        for pixel in bitmap.buffer:
            if i == 0:
                start = 0
            else:
                start = (row)*size + i%w

            # Count pixels and letters per pixel
            if (pixel > 0):
                pixel_color[start]+=1
                if not char in pixel_letters[start]:
                    pixel_letters[start].append(char)

            if not i == 0 and (i%w == 0):
                row += 1
            i+=1

        x += (slot.advance.x >> 6) 


        # count overall character appearance
        if not char in letters_count:
            letters_count[char] = 1
        else:
            letters_count[char] += 1

# Write out to file
data = {}
data['language_code'] = language
data['width']         = width
data['height']        = height
data['pixel_letters'] = []

for p in pixel_letters:
    temp = []
    for l in p:
        temp.append(l)
    data['pixel_letters'].append(temp)

data['pixel_color']   = pixel_color
data['letters_count'] = []
for l in letters_count:
    data['letters_count'].append({ 'character': l, 'value': letters_count[l] })

print(json.dumps(data))