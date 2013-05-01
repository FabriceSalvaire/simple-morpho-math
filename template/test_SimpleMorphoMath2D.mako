# -*- Python -*-

####################################################################################################
#
# SimpleMorphoMath - A simple mathematical morphology library.
# Copyright (C) 2012 Salvaire Fabrice
#
####################################################################################################

####################################################################################################

from SimpleMorphoMath.SimpleMorphoMath2D import *

####################################################################################################

l0 = Location(1, 1)
print l0
l0 = Location((1, 1))
print l0
l1 = Location(l0)
print l1
l2 = l0 + l1
print l2

####################################################################################################

# Domain(0, 10) * Domain(0, 10)
domain = Domain2D(Domain(0, 10), Domain(0, 10))
print ', '.join([str(x) for x in domain.forward_iterator()])

####################################################################################################

print 'Ball Structuring Element'
structuring_element = BallStructuringElement(1)
print '  offsets:', ', '.join([str(x) for x in structuring_element])
print '  offsets -:', ', '.join([str(x) for x in structuring_element.iterator_minus()])
print '  offsets +:', ', '.join([str(x) for x in structuring_element.iterator_plus()])
structuring_element_iterator = StructuringElementIterator(structuring_element, domain)
print '  offsets @ (5,5):', ', '.join([str(x) for x in structuring_element_iterator.iterate_at(Location(5,5))])

print 'Cross Structuring Element'
structuring_element = CrossStructuringElement(1)
print ', '.join([str(x) for x in structuring_element])

print 'HLine Structuring Element'
structuring_element = HLineStructuringElement(2)
print ', '.join([str(x) for x in structuring_element])

print 'VLine Structuring Element'
structuring_element = VLineStructuringElement(2)
print ', '.join([str(x) for x in structuring_element])

####################################################################################################

print 'Function'
#                       1  2  3  4  5  6  7  8  9 10 
function = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  1
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  2
                       [0, 0, 0, 1, 1, 1, 0, 0, 0, 0], #  3
                       [0, 0, 1, 1, 1, 1, 1, 0, 0, 0], #  4
                       [0, 0, 1, 1, 1, 1, 1, 0, 0, 0], #  5
                       [0, 0, 1, 1, 1, 1, 1, 0, 0, 0], #  6
                       [0, 0, 0, 1, 1, 1, 0, 0, 0, 0], #  7
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  8
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  9
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # 10
                       ])
function.print_object()

print 'Translated (-1, -1)'
function_translated = function.clone().translate(Location(-1, -1), padd_inf=False)
function_translated.print_object()

print 'Translated (+1, +1)'
function_translated = function.clone().translate(Location(1, 1), padd_inf=False)
function_translated.print_object()

print 'Dilated by unit ball -+-'
function_dilated = Function2D(function)
function_dilated.dilate(unit_ball)
function_dilated.print_object()

print 'Dilated by unit ball -+- using translation'
function_dilated = Function2D(function)
for offset in unit_ball:
    function_dilated.pointwise_max(function.clone().translate(offset))
function_dilated.print_object()

print 'Eroded by unit ball -+-'
function_eroded = Function2D(function)
function_eroded.erode(unit_ball)
function_eroded.print_object()

print 'Eroded by unit ball -+- using translation'
function_eroded = Function2D(function)
for offset in unit_ball:
    # print 'Translated', offset
    # function.clone().translate(offset).print_object()
    function_eroded.pointwise_min(function.clone().translate(offset))
function_eroded.print_object()

####################################################################################################

print 'Function'
#                       1  2  3  4  5  6  7  8  9 10 
function = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  1
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  2
                       [0, 0, 0, 1, 0, 1, 0, 0, 0, 0], #  3
                       [0, 0, 1, 1, 1, 1, 1, 0, 0, 0], #  4
                       [0, 0, 0, 1, 1, 1, 0, 0, 0, 0], #  5
                       [0, 0, 1, 1, 1, 1, 1, 0, 0, 0], #  6
                       [0, 0, 0, 1, 0, 1, 0, 0, 0, 0], #  7
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  8
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  9
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # 10
                       ])
function.print_object()

print 'Closed by unit ball -+-'
function_closed = Function2D(function)
function_closed.close(unit_ball)
function_closed.print_object()

print 'Opened by unit ball -+-'
function_opened = Function2D(function)
function_opened.open(unit_ball)
function_opened.print_object()

####################################################################################################

print 'Function'
#                       1  2  3  4  5  6  7  8  9 10 
function = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0,], #  1
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,], #  2
                       [0, 0, 3, 0, 0, 0, 0, 0, 0, 0,], #  3
                       [0, 0, 1, 0, 0, 0, 0, 0, 0, 0,], #  4
                       [0, 0, 2, 0, 0, 0, 0, 0, 0, 0,], #  5
                       [0, 0, 1, 0, 0, 0, 0, 0, 0, 0,], #  6
                       [0, 0, 1, 0, 0, 0, 0, 0, 0, 0,], #  7
                       [0, 0, 2, 0, 0, 0, 0, 0, 0, 0,], #  8
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,], #  9
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0,]  # 10
                       ])
function.print_object()

print 'Closed by vline -+-'
function_opened = Function2D(function)
function_opened.close(VLineStructuringElement(1))
function_opened.print_object()

##################################################################################################

print 'Function'
#                       1  2  3  4  5  6  7  8  9 10 
function = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  1
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  2
                       [0, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  3
                       [0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0], #  4
                       [0, 1, 1, 1, 0, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0], #  5
                       [0, 0, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 0, 0, 0, 0], #  6
                       [0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0], #  7
                       [0, 0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0], #  8
                       [0, 0, 0, 0, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0], #  9
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0]  # 10
                       ])
function.print_object()

print 'Opened by vline -+-'
function_opened = Function2D(function)
function_opened.open(VLineStructuringElement(1))
function_opened.print_object()

function_marker = function_opened
print 'Geodesic Reconstruction'
function_reconstructed = function.geodesic_reconstruction(function_marker)
function_reconstructed.print_object()

####################################################################################################

print 'Function'
function = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0],
                       [0, 0, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 0],
                       [0, 1, 1, 0, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0],
                       [0, 1, 0, 0, 1, 1, 1, 1, 1, 1, 1, 1, 0, 1, 0, 0, 0, 0, 0, 0],
                       [0, 1, 1, 0, 1, 1, 1, 1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 0, 0],
                       [0, 0, 1, 0, 1, 1, 1, 1, 1, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       ])
function.print_object()

marker   = Function2D([[0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 1, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       [0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0, 0],
                       ])
print 'Geodesic Reconstruction'
marker.print_object()
function_reconstructed = function.reconstruct_using_fifo(marker, verbose=True)
function_reconstructed.print_object()

####################################################################################################
#
# End
#
####################################################################################################
