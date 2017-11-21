####################################################################################################

import numpy as np

import matplotlib
import pylab

####################################################################################################

from SimpleMorphoMath.SimpleMorphoMath1D import *
from SimpleMorphoMath.MathplotlibTools import *

####################################################################################################

DEBUG = False

N = 100
level = 10
noise_scale = 2.
mu = 50.
sigma = 2.
height = 20.

x = np.arange(0, N, 1)
y_base = np.zeros(N)
for slice_ in (
    slice(10, 30),
    slice(60, 90),
    ):
    y_base[slice_] = level
noise = np.random.randn(len(x)) * noise_scale
y = y_base + noise
function_base = Function(y_base)
step(function_base)
function = Function(y)
step(function)

max_radius = 7
function_asf = Function(function)
for radius in range(1, max_radius +1):
    structuring_element = BallStructuringElement(radius)
    function_asf.close(structuring_element)
    function_asf.open(structuring_element)
step(function_asf)

threshold = 5
function_final = Function(function_asf) - threshold
step(function_final)

pylab.ylim(0, 1.1*function.max())
pylab.show()
