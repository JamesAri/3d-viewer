# 3d-viewer

`3dviewer` is an app for CPU 3D asset rendering:
- Input: .obj, .gltf, .glb, .fbx, etc.
- Output: interactive 3D viewport with FPS-style WASD + mouse controls

## Topics

> Topics marked with `(*)` are the ones you should have the deepest understanding of and which you should be able to consturct by hand (ideally with proof), not just remember them.

To understand the code, you will need a basic understanding of C++ and math (mostly linear algebra). You should **understand** these *unordered* topics:

- dot product `(*)`
- cross product `(*)`
- determinant
	- geometric interpretation
- trigonometric functions (cosine, sine, tangent) `(*)`
- finite and differential displacement
- derivative
- gram-schmidt
- vector projection
- affine interpolation
- depth buffer
- distance between point and a line/plane `(*)`
- intersetion of line and a plane `(*)`
- culling 
	- frustum culling, occlusion culling, back-face culling `(*)`
- clipping `(*)`
	- point/line/plane clipping
	- frustum clipping
	- perspective-correct interpolation after clipping
- triangle mesh
- orthographic and perspective projection `(*)`
- homogenous space
	- mostly in relation with perspective projection
	- perspective divide and ndc
- viewing axis conventions
	- cw/ccw systems, +z/-z forward
	- yaw, roll, pitch
	- up, forward, right
- basic 3d pipeline `(*)`
	- object model -> world space -> view (camera) space -> clip space -> ndc -> screen space
- matrix inverse
- orthogonal matrix
- PointAt matrix and LookAt matrix `(*)`
- MVP (or PVM) matrix `(*)`
- rotation matrices `(*)`
- quaternions
- transformations
- eigenvalues and eigenvectors
- barycentric coordinates
- basic lighting techniques
- collision detection
- bounding volumes (AABB/sphere)
- edge functions
- textures

and of course very solid understanding of vectors and matrices in general.

### Nice to know:
- cache locality
- data-oriented design - AoS vs SoA
- SIMD
- branch prediction
- cache lines and false sharing
- draw calls
- VRAM
- GPU batching
- GPU instancing
- ECS
- shaders
- time frame approaches
	- simulation x rendering x display frequencies sync
	- e.g.: fixed timestep simulation with time accumulator, simulation states interpolation, ...
- ...


