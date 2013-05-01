####################################################################################################
#
# SimpleMorphoMath - A simple mathematical morphology library.
# Copyright (C) 2012 Salvaire Fabrice
#
####################################################################################################

""" This module provide pretty printing tools.
"""

####################################################################################################

class Filet(object):

    """ This class defines a type of Unicode filet. """
    
    ##############################################

    def __init__(self,
                 horizontal, vertical,
                 top_left, top_right, bottom_left, bottom_right,
                 cross, up_t, down_t):

        self.horizontal, self.vertical = horizontal, vertical
        self.top_left, self.top_right = top_left, top_right
        self.bottom_left, self.bottom_right = bottom_left, bottom_right
        self.cross = cross
        self.up_t, self.down_t = up_t, down_t
        
####################################################################################################

empty_filet = Filet('', '', '', '', '', '', '', '', '')

ascii_filet = Filet('-', '|',
                    '+', '+', '+', '+',
                    '+', '+', '+')

solid_thin_filet = Filet(unichr(9472), unichr(9474),
                         unichr(9484), unichr(9488),
                         unichr(9492), unichr(9496),
                         unichr(9532), unichr(9516), unichr(9524))

solid_wide_filet = Filet(unichr(9473), unichr(9475),
                         unichr(9487), unichr(9491),
                         unichr(9495), unichr(9499),
                         unichr(9535), unichr(9523), unichr(9531))

solid_thin_double_filet = Filet(unichr(9552), unichr(9553),
                                unichr(9556), unichr(9559),
                                unichr(9562), unichr(9565),
                                unichr(9580), unichr(9574), unichr(9577))

####################################################################################################

class UmbraCharacter(object):

    """ This class defines a type of umbra characters. """
    
    ##############################################

    def __init__(self, black_pattern, minus_pattern, plus_pattern):

        self.black_pattern = black_pattern
        self.minus_pattern = minus_pattern
        self.plus_pattern = plus_pattern

standard_filet = solid_thin_filet
        
####################################################################################################

ascii_umbra = UmbraCharacter(black_pattern='#',
                             minus_pattern='-',
                             plus_pattern='+')

rectangle_umbra = UmbraCharacter(black_pattern=unichr(9609),
                                 minus_pattern=unichr(9015), # unichr(9984)
                                 plus_pattern=unichr(9617))

small_square_umbra = UmbraCharacter(black_pattern=unichr(9642),
                                    minus_pattern=unichr(9643),
                                    plus_pattern=unichr(9670))

small_square2_umbra = UmbraCharacter(black_pattern=unichr(9726),
                                     minus_pattern=unichr(9725),
                                     plus_pattern=unichr(9679))

large_square_umbra = UmbraCharacter(black_pattern=unichr(9724),
                                    minus_pattern=unichr(9723),
                                    plus_pattern=unichr(9679))

large_square2_umbra = UmbraCharacter(black_pattern=unichr(9632),
                                    minus_pattern=unichr(9633),
                                    plus_pattern=unichr(9640))

standard_umbra = large_square_umbra

####################################################################################################
#
# End
#
####################################################################################################
