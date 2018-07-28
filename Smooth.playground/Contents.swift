//: Playground - noun: a place where people can play

import UIKit
import Smooth

let data: [Float] = [0.4184939196815112, 1.0467476150419859, 1.7016395890657607, 1.7503994435991819, 0.6855036166770087, 0.7148266483213545, 0.14613983514455942, -0.05529089916735186, -0.47172878687659603, 0.37716300002284897, 0.2536673835482497, 1.3117913732870903, 1.6555464925435008, 1.8874035334637767, 0.8275811744398001, 0.009996856477936834, -0.2668648700943922, -0.3616110945432369, -0.40377104562669974, 0.2128161006000998]

/*:

 # Smooth

 */

/*:

 ## Input Data

 */

data.map { $0 }

/*:

 ## Interpolation

 */

LinearInterpolator(points: data).resample(interval: 0.5).map { $0 }

SincFilterInterpolator(points: data, filterSize: 3).resample(interval: 0.5).map { $0 }

CubicInterpolator(points: data, tension: 0.1).resample(interval: 0.5).map { $0 }

/*:

 ## Smoothing

 resample twice

 */

LinearInterpolator(points:
    LinearInterpolator(points: data).resample(interval: 3)
).resample(interval: 0.25).map { $0 }

SincFilterInterpolator(points:
    SincFilterInterpolator(points: data, filterSize: 4).resample(interval: 3)
    , filterSize: 4).resample(interval: 0.25).map { $0 }

CubicInterpolator(points:
    CubicInterpolator(points: data, tension: 0.1).resample(interval: 3)
, tension: 0.1).resample(interval: 0.25).map { $0 }
