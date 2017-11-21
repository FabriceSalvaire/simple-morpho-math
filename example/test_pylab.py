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
curvature = -0.01
bias = 50.
noise_scale = 3.
mu = 50.
sigma = 2.
height = 20.

x = np.arange(0, N, 1)
y_base = curvature*(x - mu)**2 + bias
noise = np.random.randn(len(x)) * noise_scale
peak = height * np.exp(-(x - mu)**2 / (2 * sigma**2)) # /(sigma * np.sqrt(2 * np.pi))
y = y_base + noise + peak
pylab.plot(x, y_base)
if DEBUG:
    pylab.plot(x, noise)
    pylab.plot(x, peak)
    pylab.plot(x, y)

function = Function(y)
step(function)

top_hat_radius = 5

function_opened = Function(function)
function_opened.open(BallStructuringElement(radius=top_hat_radius))
step(function_opened)

function_top_hated = Function(function) - function_opened
step(function_top_hated)

function_asf = Function(function)
for radius in range(1, top_hat_radius +1):
    structuring_element = BallStructuringElement(radius)
    function_asf.close(structuring_element)
    function_asf.open(structuring_element)
step(function_asf)
function_asf_top_hated = Function(function) - function_asf
step(function_asf_top_hated)

function_marker = Function(function_asf_top_hated) - 10
# step(function_marker)

function_reconstructed = function_asf_top_hated.geodesic_reconstruction(function_marker)
#step(function_reconstructed)

function_final =  Function(np.logical_and(function_asf_top_hated.values, function_reconstructed.values) * function_asf_top_hated.values)
#step(function_final)

pylab.ylim(0, 1.1*function.max())
pylab.show()
