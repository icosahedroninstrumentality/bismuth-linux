# $$\text{Ico's SDF shapes}$$

### $$p = \frac{ 2 * S }{ R }$$

### $$S_i = S ^ { -1 }$$

### $$d = \sum{ \left|(P - C) * S_i \right| ^ p }$$

$\text{Where:}$

$P\text{ is the current point of a graph being evaulated;}$

$C\text{ is the absolute position of the shape's center;}$

$S\text{ is the amount that the shape expands from the center;}$

$R\text{ is the percieved corner radius;}$

$d\text{ is the distance to the center, with }1\text{ at the shape edge.}$

<br>

$p \text{ represents a power of a superellipse that is perceptually closest to a rounded rectangle of the same parameters.}$

$\text{To get a mask of }d\text{ that can be used in graphics:}$

$$m = \max(0, 1 - d ^ {R_{min}})$$

$\text{Where }R_{min}\text{ is the smallest component of R.}$

---

Public domain (x), Icosahedron Instrumentality.

We donate this formula to the public domain for the betterment of all software.
