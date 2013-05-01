## -*- Python -*-
## -*- coding: utf-8 -*-

## #################################################################################################
##
## SimpleMorphoMath - A simple mathematical morphology library.
## Copyright (C) 2012 Salvaire Fabrice
##
## #################################################################################################

## #################################################################################################

<%self:doc>
==========
 Tutorial
==========

.. hint::

  This page require to setup a Unicode monospaced font (e.g. DejaVu Sans Mono) for the browser.  You
  also need an Unicode Terminal to display correctly the output of the code.  To execude this code,
  best would be to use Ipython, an Interactive Python Console.

Load modules::
</%self:doc>
<%self:code>
import numpy as np
from SimpleMorphoMath.SimpleMorphoMath1D import *
</%self:code>
## from SimpleMorphoMath import PrettyPrinting
## Function.umbra_character = PrettyPrinting.ascii_umbra
## Function.umbra_character = PrettyPrinting.small_square_umbra
## Function.umbra_character = PrettyPrinting.small_square2_umbra
## Function.umbra_character = PrettyPrinting.large_square_umbra
## Function.umbra_character = PrettyPrinting.large_square2_umbra
## Function.filet = PrettyPrinting.ascii_filet
<%self:doc>
Create a new function f(x) and plot its umbra::
</%self:doc>
<%self:code>
function = Function((5,7,6,9,9,4,5,10,8,9,8,6,3,5,7,9,2,6))
@result@ function.plot(plot_type='umbra')
</%self:code>
<%self:doc>
The umbra of a function f(x) is the set of all values (x, v) such that value v is less
than or equal to f(x): :math:`{(x,v) | v \leq f(x)}`.

Translate on the left the function f(x): :math:`f_{-1}(x) = f(x-1)`::
</%self:doc>
<%self:code>
function_translated = function.clone().translate(-1)
@result@ function_translated.plot(plot_type='umbra')
</%self:code>
<%self:doc>
The function is padded on the right with the infinimum of the function domain, thus zero.

Translate on the right the function f(x): :math:`f_{+1}(x) = f(x+1)`::
</%self:doc>
<%self:code>
function_translated = function.clone().translate(1)
@result@ function_translated.plot(plot_type='umbra')
</%self:code>
<%self:doc>
The function is padded on the left with zero.

Let's dilate the function f(x) by the so-called unit-ball structuring element :math:`g(x) = 1` over
the range ::math:`{-1 \leq x \leq 1}`, 0 otherwise::
</%self:doc>
<%self:code>
function_dilated = Function(function)
function_dilated.dilate(unit_ball)
@result@ function_dilated.plot(plot_type='umbra')
</%self:code>
<%self:doc>
Plot with the original function as mask::
</%self:doc>
<%self:code>
@result@ function_dilated.plot(plot_type='umbra', mask=function)
</%self:code>
<%self:doc>
Recompute the dilation using the point wise maximum of the set of translated corresponding to the
structuring element::
</%self:doc>
<%self:code>
function_dilated = Function(function)
for offset in -1, 1:
    function_dilated.pointwise_max(function.clone().translate(offset))
@result@ function_dilated.plot(plot_type='umbra', mask=function)
</%self:code>
<%self:doc>
Erode by the unit ball::
</%self:doc>
<%self:code>
function_eroded = Function(function)
function_eroded.erode(unit_ball)
@result@ function_eroded.plot(plot_type='umbra', mask=function)
</%self:code>

<%self:doc>
.. End
</%self:doc>

## #################################################################################################
##
## End
##
## #################################################################################################
