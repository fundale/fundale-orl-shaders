# Fundale's ORL Shader Modules

## Requires the Development version of [Orels1's Modular Shader Generator](https://dev.shaders.orels.sh/docs/installation), then enable "Show Prerelease Packages" in VCC or ALCOM.

## A small collection of the [ORL Modules](https://github.com/orels1/orels-Unity-Shaders) I use on my VRChat Avatars, along with the [XSToon Base](https://github.com/Xiexe/Xiexes-Unity-Shaders) that it's built on.

## Some of the Modules included (but not limited to) are:
- AudioLink Chroma
- AudioLink Vertex
- Crowdwave
- LTCGI (modified)
- Luma
- Video

- Outline (modified)
- Sheen (modified)
- Toon FragmentBase (modified)


# Module Features

## Common (Not all modules may have these)
- Enable Module: Most modules have a `shader_feature` compiler directive, leave these enabled on upload if you wish to toggle a module off.
- Module Tint: The output color to use *multiplied* by the Module's calculated color.
- Module Mask: The (RGB) Mask that controls where the Module renders.
- Use Module Map: Whether to use the Map for where to sample from.
- Module Map: For "flow" based Modules, with [R,G,B] being masks for Functions 1-3 and Alpha being the flow's progress from 1.0 (start) to 0.0 (end), 1.0 - Alpha.
- Module Scale Effects: Whether to scale FX with the Mask's UV.
- Module Rotation: The rotation of a Module when not in Map mode (-360deg through 360deg)
- Module Warp: For "flow" based modules, warps the progrss forward or backwards using pow() to give a sluggish or snappier effect.
- Module Bias: How much to force recolor the Module's output to match the user's desired Module Tint.

- AudioLink Band: What AudioLink band to use, [Bass, Low Mid, High Mid, Treble]
- AudioLink History: How many AudioLink History units to use for flowing reactions.

## AudioLink Chroma
- Idle Intensity: How bright to glow when AudioLink isn't available or forced idle.
- Force Idle: Pretend like AudioLink doesn't exist and carry on. ;)
- Chroma Mode \<R,G,B>: What Chroma mode to use for \<C> channel.
  - Mode 0 is off.
  1. Color Theme 1 to Color Theme 2
  2. Color Theme 3 to Color Theme 4
  3. Color Themes 1 - 4
  4. Solid Hue Chronotensity
  5. Hue Value
  6. Hue Time Gradient
  7. Hue Time Gradient + Time Pulse Gradient
  8. Hue Chronotensity Gradient
  9. Waveform Hue
  10. Warped Waveform Hue
- Chroma Speed: How fast to scroll Chroma effects.
- Force Chroma Theme: Ignore AudioLink's Theme colors and use our own.
- Chrome Theme \<N>: What color to use for that Theme number.


## AudioLink Vertex
- Vertex Map: [R] Where to allow vertex offsets, [G] how long down the History to react.
- AudioLink Intensity: How far (in relative meters) to move the Vertices to AudioLink.

## Crowdwave
- Use Range: Whether to map multiple parts of the visuals across the Avatar or just a single part at the Avatar's center.

## LTCGI
- LTCGI Ramp: [R] Custom lighting ramp for Posterized Toon lighting.

## Luma
- Reactive Priority: When both AudioLink and Luma are present which one to prefer, (only visible when both AudioLink Chroma and Luma Modules are used).
- Legacy Luma Fallback: Whether to attempt to fallback to the legacy Luma system when *new* Luma isn't present.
- Luma Gradient \<N>: Which Luma gradient to use per Function channel, (Luma Legacy uses "Hero" colors for History).

## Video
- Apply Video Transform: Whether to adjust and clip the Global Video Texture according to what the world Author intends.
- Video ScaleTransform: Manually specify a region of the Video to use.
- Video As Albedo: Whether to render the Global Video Texture as lit (Albedo) rather than emissive (Emission).
- Video Fallback: The fallback texture to display when no Global Video Texture is available.
- Video UV Map: Uses [R,G] as the [X,Y] to use from the video, may require Blender / Substance baking.
- Video Ratio: The aspect Ratio to display the Global Video Texture (decal) in, usually 16:9 (1.777777)


# Module modifications more specific to the XSToon Shader

## Outline
- Width Mask: [R] Texture that determines the relative width of the Outline.

## Sheen
- Sheen Mask: [R] UI Sheen effect with texture masking.

## Toon FragmentBase
- Monochrome Lighting: XSToon Monochrome Lighting has been tweaked to imitate Poiyomi Toon's Monochrome Lighting.


## Thank You
[Orels1](https://orels.sh/) for making a cool Shader Module system!
Roimu for testing, suggestions, and feedback.
[McArdellje](https://vrchat.com/home/user/usr_15c25e4d-255f-4d91-910e-d85169ff3676) for getting me started on Shaders.
