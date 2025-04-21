Shader "Fundale/Avatar/ORL Toon Custom (Baked)"
{
    Properties {
        UI_MainHeader("# Main Settings", Int) = 1
        UI_ToonDocs("[This shader has documentation](https://shaders.orels.sh/docs/toon)", Int) = 0
        _Color("Main Color", Color) = (1, 1, 1, 1)
        _BackfaceColor("Backface Color %ShowIf(_CullMode != 2)", Color) = (1, 1, 1, 1)
        _BackfaceAlbedoTint("Backface Albedo Tint", Range(0,1)) = 1
        [ToggleUI]_TintByVertexColor("Tint By Vertex Color", Int) = 0
        _MainTex("Albedo", 2D) = "white" {}
        [Toggle(SEPARATE_ALPHA)]_SeparateAlpha("Separate Transparency Texture", Int) = 0
        _AlphaTex("Transparency %ShowIf(_SeparateAlpha)", 2D) = "white" {}
        _AlphaScale("Alpha Scale %ShowIf(_MainTex || SEPARATE_ALPHA)", Range(0,2)) = 1
        [Enum(UV1, 0, UV2, 1, UV3, 2, UV4, 3)]_MainTexUVSet("UV Set", Int) = 0
        _Hue("Hue", Range(0,1)) = 0
        _Saturation("Saturation", Range(-1,1)) = 0
        _Value("Value", Range(-1,1)) = 0
        _Ramp("Ramp %Gradient()", 2D) = "grayscaleRamp" {}
        _ShadowSharpness("Shadow Sharpness", Range(0,1)) = 0.5
        _OcclusionMap("Occlusion >", 2D) = "white" {}
        _OcclusionStrength("Occlusion Strength %ShowIf(_OcclusionMap)", Range(0,1)) = 0
        [Enum(Synced With Albedo, 0, Independent, 1)]_OcclusionTilingMode("Tiling Mode %ShowIf(_OcclusionMap)", Int) = 0
        _OcclusionTiling("Tiling %ShowIf(_OcclusionMap)", Float) = 1
        UI_OcclusionTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_OcclusionTilingMode == 0 && _OcclusionMap)", Int) = 0
        UI_OcclusionTilingIndependentNote("> Will scale UVs on its own %ShowIf(_OcclusionTilingMode == 1 && _OcclusionMap)", Int) = 0
        [ToggleUI]_OcclusionDetailEnabled("Occlusion Detail Enabled", Int) = 0
        _OcclusionDetail("Occlusion Detail > %ShowIf(_OcclusionDetailEnabled)", 2D) = "white" {}
        _OcclusionDetailStrength("Occlusion Detail Strength %ShowIf(_OcclusionDetail && _OcclusionDetailEnabled)", Range(0,1)) = 1
        [Enum(Synced With Albedo, 0, Independent, 1)]_OcclusionDetailTilingMode("Tiling Mode %ShowIf(_OcclusionDetail)", Int) = 0
        _OcclusionDetailTiling("Tiling %ShowIf(_OcclusionDetail)", Float) = 1
        UI_OcclusionDetailTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_OcclusionDetailTilingMode == 0 && _OcclusionDetail)", Int) = 0
        UI_OcclusionDetailTilingIndependentNote("> Will scale UVs on its own %ShowIf(_OcclusionDetailTilingMode == 1 && _OcclusionDetail)", Int) = 0
        [Enum(Classic, 0, Integrated, 1)]_OcclusionMode("Occlusion Mode %ShowIf(_OcclusionMap || _OcclusionDetail)", Int) = 0
        UI_OcclusionIndirectModeNote("> Multiplies indirect light by occlusion %ShowIf((_OcclusionMap || _OcclusionDetail) && _OcclusionMode == 0)", Int) = 0
        UI_OcclusionIntegrateModeNote("> Multiplies the shadow ramp by occlusion %ShowIf((_OcclusionMap || _OcclusionDetail) && _OcclusionMode == 1)", Int) = 0
        [ToggleUI]UI_AudioLinkVertexHeader("# AudioLink Vertex", Int) = 1
        [Toggle(_AUDIOLINKVERTEX)]_EnableAudioLinkVertex("Enable AudioLink Vertex", Int) = 0
        _AudioLinkVertexMap("Vertex Map %ShowIf(_EnableAudioLinkVertex)", 2D) = "white" {}
        [Enum(Bass,0,Low Mid,1,High Mid,2,Treble,3)]_AudioLinkVertexBand("AudioLink Band %ShowIf(_EnableAudioLinkVertex)", Int) = 0
        _AudioLinkVertexHistory("AudioLink History %ShowIf(_EnableAudioLinkVertex)", Range(0.0, 128.0)) = 32.0
        _AudioLinkVertexIntensity("AudioLink Intensity %ShowIf(_EnableAudioLinkVertex)", Range(0.0, 1.0)) = 0.1
        UI_NormalsHeader("# Normals", Int) = 0
        _BumpMap("Normal Map > %SetKeyword(_BumpMap, NORMALS_SET)", 2D) = "bump" {}
        [Enum(Synced With Albedo, 0, Independent, 1)]_BumpMapTilingMode("Normal Tiling Mode %ShowIf(_BumpMap)", Int) = 0
        _BumpMapTiling("Normal Tiling %ShowIf(_BumpMap)", Float) = 1
        UI_BumpMapTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_BumpMapTilingMode == 0 && _BumpMap)", Int) = 0
        UI_BumpMapTilingIndependentNote("> Will scale UVs on its own %ShowIf(_BumpMapTilingMode == 1 && _BumpMap)", Int) = 0
        _BumpScale("Normal Map Scale %ShowIf(_BumpMap)", Range(-2, 2)) = 1
        [ToggleUI]_FlipBumpY ("Flip Y (UE Mode) %ShowIf(_BumpMap)", Int) = 0
        [ToggleUI]_NormalBicubicSampling("Use Bicubic Sampling %ShowIf(_BumpMap)", Int) = 0
        _DetailNormalMap("Detail Normal > %SetKeyword(_DetailNormalMap, DETAIL_NORMALS_SET)", 2D) = "bump" {}
        [Enum(UV1, 0, UV2, 1, UV3, 2, UV4, 3)]_DetailNormalsUVSet("UV Set %ShowIf(_DetailNormalMap)", Int) = 0
        _DetailNormalTiling("Tiling %ShowIf(_DetailNormalMap)", Float) = 1
        _DetailNormalScale("Detail Normal Map Scale %ShowIf(_DetailNormalMap)", Range(-2, 2)) = 1
        [ToggleUI]_FlipDetailNormalY("Flip Y (UE Mode) %ShowIf(_DetailNormalMap)", Int) = 0
        _DetailNormalMask("Detail Normal Mask > %ShowIf(_DetailNormalMap)", 2D) = "white" {}
        [Enum(UV1, 0, UV2, 1, UV3, 2, UV4, 3)]_DetailNormalMaskUVSet("UV Set %ShowIf(_DetailNormalMask && _DetailNormalMap)", Int) = 0
        _DetailNormalMaskTiling("Tiling %ShowIf(_DetailNormalMask && _DetailNormalMap)", Float) = 1
        UI_OutlineHeader("# Outline", Int) = 0
        [Toggle(OUTLINE_ENABLED)]_Outline("Enable Outline %SetProp((!_OutlineIgnoreStencils && OUTLINE_ENABLED), _StencilBasePass, 2, 0)", Int) = 0
        _OutlineTex("Texture > %ShowIf(OUTLINE_ENABLED)", 2D) = "white" {}
        [HDR]_OutlineColor("Color %ShowIf(OUTLINE_ENABLED)", Color) = (0.5, 0.5, 0.5, 1)
        [Enum(Lit, 0, Emissive, 1)]_OutlineLightingMode("Lighting Mode %ShowIf(OUTLINE_ENABLED)", Int) = 0
        _OutlineAlbedoTint("Albedo Tint %ShowIf(OUTLINE_ENABLED)", Range(0, 1)) = 0
        [Tooltip(Uses the Red channel)]_OutlineMask("Width Mask %ShowIf(OUTLINE_ENABLED)", 2D) = "white" {}
        [PowerSlider(3.0)]_OutlineWidth("Width %ShowIf(OUTLINE_ENABLED)", Range(0, 10)) = 1
        [ToggleUI]_OutlineWidthAdjustByVertexColor("Adjust by Vertex Color", Int) = 0
        [HideInInspector]_StencilBasePass("Stencil Base Pass", Float) = 0
        [ToggleUI]_OutlineIgnoreStencils("Ignore Stencils %SetProp((_OutlineIgnoreStencils), _StencilOutlineComp, 8, 6) %ShowIf(OUTLINE_ENABLED)", Int) = 0
        UI_OutlineIgnoreStencilsNote("> Allows overlapping shapes to show outlines on top of each other. Does not work correctly with transparent materials", Int) = 0
        [HideInInspector]_StencilOutlineComp("Stencil Outline Comp", Float) = 6
        [HideInInspector]_StencilBaseComp("Stencil Base Comp", Float) = 8
        UI_SpecularHeader("# Specular", Int) = 0
        [Toggle(SPECULAR_ON)]_SpecularOn("Enable Specular", Int) = 0
        _SpecularMap("Specular Map > %ShowIf(SPECULAR_ON)", 2D) = "white" {}
        UI_SpecMapdNote("> Red - Intensity, Green - Albedo Tint, Blue - Roughness %ShowIf(SPECULAR_ON)", Int) = 0
        [Enum(Synced With Albedo, 0, Independent, 1)]_SpecularTilingMode("Tiling Mode %ShowIf(_SpecularMap)", Int) = 0
        _SpecularTiling("Tiling %ShowIf(_SpecularMap)", Float) = 1
        UI_SpecularTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_SpecularTilingMode == 0 && _SpecularMap)", Int) = 0
        UI_SpecularTilingIndependentNote("> Will scale UVs on its own %ShowIf(_SpecularTilingMode == 1 && _SpecularMap)", Int) = 0
        _SpecularIntensity("Intensity %ShowIf(SPECULAR_ON)", Float) = 0
        _SpecularRoughness("Roughness %ShowIf(SPECULAR_ON)", Range(0, 1)) = 0
        _SpecularSharpness("Sharpness %ShowIf(SPECULAR_ON)", Range(0, 1)) = 0
        _SpecularAnisotropy("Anisotropy %ShowIf(SPECULAR_ON)", Range(-1.0, 1.0)) = 0
        _SpecularAlbedoTint("Albedo Tint %ShowIf(SPECULAR_ON)", Range(0, 1)) = 1
        UI_SpecularMasking("## Masking %ShowIf(SPECULAR_ON)", Int) = 0
        _SpecularMask("Specular Mask > %ShowIf(SPECULAR_ON)", 2D) = "white" {}
        [Enum(Synced With Albedo, 0, Independent, 1)]_SpecularMaskTilingMode("Tiling Mode %ShowIf(_SpecularMask)", Int) = 0
        _SpecularMaskTiling("Tiling %ShowIf(_SpecularMask)", Float) = 1
        UI_SpecularMaskTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_SpecularMaskTilingMode == 0 && _SpecularMask)", Int) = 0
        UI_SpecularMaskTilingIndependentNote("> Will scale UVs on its own %ShowIf(_SpecularMaskTilingMode == 1 && _SpecularMask)", Int) = 0
        _SpecularMaskStrength("Mask Strength %ShowIf(SPECULAR_ON)", Range(0, 1)) = 1
        UI_ReflectionsHeader("# Reflections", Int) = 0
        [KeywordEnum(Off, PBR, Baked Cubemap, Matcap)]REFLECTION_MODE("Reflection Mode", Int) = 0
        [Enum(Additive,0,Multiply,1,Subtract,2)] _ReflectionBlendMode("Reflection Blend Mode %ShowIf(!REFLECTION_MODE_OFF)", Float) = 0
        _BakedCubemap("BakedCubemap > %ShowIf(REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)", CUBE) = "black" {}
        UI_FallbackNote("> Will be used if world has no reflections %ShowIf(REFLECTION_MODE_PBR)", Int) = 0
        _MetallicGlossMap("Metallic Smoothness > %ShowIf(REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)", 2D) = "white" {}
        UI_MetallicNote("> R - Metallic, A - Smoothness %ShowIf(REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)", Int) = 0
        [Enum(Synced With Albedo, 0, Independent, 1)]_MetallicGlossMapTilingMode("Tiling Mode %ShowIf(_MetallicGlossMap)", Int) = 0
        _MetallicGlossMapTiling("Tiling %ShowIf(_MetallicGlossMap)", Float) = 1
        UI_MetallicGlossMapTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_MetallicGlossMapTilingMode == 0 && _MetallicGlossMap)", Int) = 0
        UI_MetallicGlossMapTilingIndependentNote("> Will scale UVs on its own %ShowIf(_MetallicGlossMapTilingMode == 1 && _MetallicGlossMap)", Int) = 0
        _Smoothness ("Smoothness %ShowIf(!_MetallicGlossMap && (REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP))", Range(0, 1)) = 0.5
        [ToggleUI]_RoughnessMode ("Roughness Mode %ShowIf(_MetallicGlossMap && (REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP))", Int) = 0
        _Metallic ("Metallic %ShowIf(!_MetallicGlossMap && (REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP))", Range(0, 1)) = 0
        [HideInInspector]_MetallicRemap ("Metallic Remap %ShowIf(_MetallicGlossMap && (REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)) %RemapSlider(0,1)", Vector) = (0, 1, 0, 1)
        [HideInInspector]_SmoothnessRemap ("Smoothness Remap %ShowIf(_MetallicGlossMap && (REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)) %RemapSlider(0,1)", Vector) = (0, 1, 0, 1)
        _ReflectionAnisotropy("Anisotropy %ShowIf(REFLECTION_MODE_PBR || REFLECTION_MODE_BAKED_CUBEMAP)", Range(-1, 1)) = 0
        _Matcap("Matcap > %ShowIf(REFLECTION_MODE_MATCAP)", 2D) = "black" {}
        _MatcapBlur("Matcap Blur Level %ShowIf(REFLECTION_MODE_MATCAP)", Range(0, 1)) = 0
        _MatcapTintToDiffuse("Tint Matcap to Diffuse %ShowIf(REFLECTION_MODE_MATCAP)", Range(0, 1)) = 0
        _ReflectivityMask("Reflectivity Mask > %ShowIf(!REFLECTION_MODE_OFF)", 2D) = "white" {}
        [Enum(Synced With Albedo, 0, Independent, 1)]_ReflectivityMaskTilingMode("Tiling Mode %ShowIf(_ReflectivityMask)", Int) = 0
        _ReflectivityMaskTiling("Tiling %ShowIf(_ReflectivityMask)", Float) = 1
        UI_ReflectivityMaskTilingSyncedNote("> Will scale UVs based on the Albedo texture Tiling and Offset settings %ShowIf(_ReflectivityMaskTilingMode == 0 && _ReflectivityMask)", Int) = 0
        UI_ReflectivityMaskTilingIndependentNote("> Will scale UVs on its own %ShowIf(_ReflectivityMaskTilingMode == 1 && _ReflectivityMask)", Int) = 0
        _ReflectivityLevel("Reflectivity %ShowIf(!REFLECTION_MODE_OFF)", Range(0, 1)) = 0.5
        UI_AudioLink("# AudioLink", Int) = 0
        [KeywordEnum(None, Single Channel, Packed Map, UV Based)]AL_MODE("Audio Link Mode", Int) = 0
        [NoScaleOffset]_ALMap("Audio Link Map > %ShowIf(!AL_MODE_NONE)", 2D) = "white" {}
        [Enum(UV1, 0, UV2, 1, UV3, 2, UV4, 3)]_ALMapUVSet("UV Set %ShowIf(!AL_MODE_NONE)", Int) = 0
        [HDR]_ALEmissionColor("Color %ShowIf(!AL_MODE_NONE && !AL_MODE_PACKED_MAP)", Color) = (0,0,0,0)
        [ToggleUI]_ALEmissionDotMask("Audio Link Rim Mask", Int) = 0
        UI_ALEmissionDotMaskNote("> When enabled, the AudioLink-powered emission will be darkened by the rim settings", Int) = 1
        [ToggleUI]_ALEmissionDotMaskInvert("Invert Rim Mask %ShowIf(_ALEmissionDotMask)", Int) = 0
        _ALEmissionDotMaskSmoothing("Rim Mask Smoothing %ShowIf(_ALEmissionDotMask)", Float) = 2
        [Enum(Bass,0,Low Mids,1,High Mids,3,Treble,4)]_ALBand("Frequency Band %ShowIf(AL_MODE_SINGLE_CHANNEL)", Int) = 0
        [IntRange]_ALSmoothingLevel("Smoothing Level %ShowIf(AL_MODE_PACKED_MAP || AL_MODE_SINGLE_CHANNEL)", Range(0, 16)) = 1
        UI_ALPackedRedHeader("## Red Channel %ShowIf(AL_MODE_PACKED_MAP)", Int) = 0
        [ToggleUI]_ALGradientOnRed("Gradient %ShowIf(AL_MODE_PACKED_MAP) %CombineWith(_ALPackedRedColor)", Int) = 0
        [HideInInspector][HDR]_ALPackedRedColor("Color", Color) = (0,0,0,0)
        UI_ALPackedGreenHeader("## Green Channel %ShowIf(AL_MODE_PACKED_MAP)", Int) = 0
        [ToggleUI]_ALGradientOnGreen("Gradient %ShowIf(AL_MODE_PACKED_MAP) %CombineWith(_ALPackedGreenColor)", Int) = 0
        [HideInInspector][HDR]_ALPackedGreenColor("Color", Color) = (0,0,0,0)
        UI_ALPackedBlueHeader("## Blue Channel %ShowIf(AL_MODE_PACKED_MAP)", Int) = 0
        [ToggleUI]_ALGradientOnBlue("Gradient %ShowIf(AL_MODE_PACKED_MAP) %CombineWith(_ALPackedBlueColor)", Int) = 0
        [HideInInspector][HDR]_ALPackedBlueColor("Color", Color) = (0,0,0,0)
        [IntRange]_ALUVWidth("History Sample Amount %ShowIf(AL_MODE_UV_BASED)", Range(0,128)) = 128
        UI_EmissionHeader("# Emission", Int) = 0
        [NoScaleOffset]_EmissionMap("Emission Map > %SetKeyword(_EmissionMap, _EMISSION)", 2D) = "white" {}
        [HDR]_EmissionColor("Color", Color) = (0,0,0,1)
        _EmissionTintToDiffuse("Tint To Diffuse", Range(0,1)) = 0
        [Tooltip(Hides emission unless light is weaker than Scaling Sensitivity)][Enum(No,0,Yes,1)]_EmissionScaleWithLight("Scale w/ Light", Int) = 0
        _EmissionScaleWithLightSensitivity("Scaling Sensitivity %ShowIf(_EmissionScaleWithLight == 1)", Range(0,1)) = 1
        UI_RimLightHeader("# Rim Light", Int) = 0
        [Toggle(RIMLIGHT_ON)]_RimLight("Enable Rim Light", Int) = 0
        _RimTint("Tint %ShowIf(RIMLIGHT_ON)", Color) = (1,1,1,1)
        _RimIntensity("Intensity %ShowIf(RIMLIGHT_ON)", Float) = 0
        _RimAlbedoTint("Albedo Tint %ShowIf(RIMLIGHT_ON)", Range(0,1)) = 0
        _RimEnvironmentTint("Environment Tint %ShowIf(RIMLIGHT_ON)", Range(0,1)) = 0
        [Tooltip(Controls how much the rimlight will be visible in shadowed areas. 0 always visible)]_RimAttenuation("Attenuation %ShowIf(RIMLIGHT_ON)", Range(0,1)) = 1
        _RimRange("Range %ShowIf(RIMLIGHT_ON)", Range(0, 1)) = 0.7
        [Tooltip(Controls how much the rim light will be offset by the light direction. 1 Will only show up in the areas hit by the light, 0 will show up everywhere)]_RimThreshold("Threshold %ShowIf(RIMLIGHT_ON)", Range(0, 1)) = 0.1
        _RimSharpness("Sharpness %ShowIf(RIMLIGHT_ON)", Range(0,1)) = 0.1
        [ToggleUI]UI_RimShadowHeader("# Rim Shadow", Int) = 0
        [Toggle(RIMSHADOW_ON)]_RimShadow("Enable Rim Shadow", Int) = 0
        _ShadowRimTint("Tint %ShowIf(RIMSHADOW_ON)", Color) = (1,1,1,1)
        _ShadowRimRange("Range %ShowIf(RIMSHADOW_ON)", Range(0,1)) = 0.7
        [Tooltip(Controls how much the rim shadow will be offset by the light direction. 1 Will only show up in the areas in shadow, 0 will show up everywhere)]_ShadowRimThreshold("Threshold %ShowIf(RIMSHADOW_ON)", Range(0,1)) = 0.1
        _ShadowRimSharpness("Sharpness %ShowIf(RIMSHADOW_ON)", Range(0,1)) = 0.3
        _ShadowRimAlbedoTint("Albedo Tint %ShowIf(RIMSHADOW_ON)", Range(0,1)) = 0
        UI_AudioLink_Chroma_Header("# AudioLink Chroma", Int) = 1
        [Toggle(_AUDIOLINKCHROMA)]_EnableAudioLinkChroma("Enable AudioLink Chroma" , Int) = 0
        [HDR]_ChromaTint("Chroma Tint %ShowIf(_EnableAudioLinkChroma)", Color) = (1.0, 1.0, 1.0, 1.0)
        _ChromaMask("Chroma Mask %ShowIf(_EnableAudioLinkChroma)", 2D) = "white" {}
        [Toggle(_CHROMAMAP)]_UseChromaMap("Use Chroma Map %ShowIf(_EnableAudioLinkChroma)", Int) = 0
        _ChromaMap("Chroma Map > %ShowIf(_EnableAudioLinkChroma && _UseChromaMap)", 2D) = "black" {}
        [Enum(Bass,0,Low Mid,1,High Mid,2,Treble,3)]_ChromaBand("Chroma Band %ShowIf(_EnableAudioLinkChroma && !_UseChromaMap)", Int) = 0
        _ChromaRotation("Chroma Rotation %ShowIf(_EnableAudioLinkChroma && !_UseChromaMap)", Range(-360, 360)) = 0
        [Toggle]_ChromaForceIdle("Force Chroma Idle %ShowIf(_EnableAudioLinkChroma)", Int) = 0
        [IntRange]_ChromaModeR("Chroma Mode R %ShowIf(_EnableAudioLinkChroma)", Range(0, 10)) = 0
        [IntRange]_ChromaModeG("Chroma Mode G %ShowIf(_EnableAudioLinkChroma && _UseChromaMap)", Range(0, 10)) = 0
        [IntRange]_ChromaModeB("Chroma Mode B %ShowIf(_EnableAudioLinkChroma && _UseChromaMap)", Range(0, 10)) = 0
        _ChromaHistory("Chroma History %ShowIf(_EnableAudioLinkChroma)", Range(0.0, 128.0)) = 32.0
        _ChromaWarp("Chroma Warp %ShowIf(_EnableAudioLinkChroma)", Range(0.0, 2.0)) = 1.0
        _ChromaSpeed("Chroma Speed %ShowIf(_EnableAudioLinkChroma)", Range(0.0, 10.0)) = 1.0
        _ChromaBiased("Chroma Color Bias %ShowIf(_EnableAudioLinkChroma)", Range(0.0, 1.0)) = 0.0
        [Toggle]_ChromaForceTheme("Force Chroma Theme %ShowIf(_EnableAudioLinkChroma)", Int) = 0
        _ChromaTheme0("Chroma Theme 0 %ShowIf(_EnableAudioLinkChroma)", Color) = (1.0, 0.0, 0.0, 1.0)
        _ChromaTheme1("Chroma Theme 1 %ShowIf(_EnableAudioLinkChroma)", Color) = (1.0, 1.0, 0.0, 1.0)
        _ChromaTheme2("Chroma Theme 2 %ShowIf(_EnableAudioLinkChroma)", Color) = (0.0, 1.0, 0.0, 1.0)
        _ChromaTheme3("Chroma Theme 3 %ShowIf(_EnableAudioLinkChroma)", Color) = (0.0, 0.0, 1.0, 1.0)
        UI_Luma_Header("# Luma", Int) = 1
        [Toggle(_LUMA)]_EnableLuma("Enable Luma", Int) = 0
        [Enum(Luma,0,AudioLink,1)]_ReactPriority("Reactive Priority %ShowIf(_EnableLuma && _EnableAudioLinkChroma)", Int) = 0
        [Toggle(_LUMALEGACY)]_LumaLegacy("Legacy Luma Fallback %ShowIf(_EnableLuma)", Int) = 1
        [HDR]_LumaTint("Luma Tint %ShowIf(_EnableLuma)", Color) = (1.0, 1.0, 1.0, 1.0)
        _LumaMask("Luma Mask %ShowIf(_EnableLuma)", 2D) = "white" {}
        [Toggle(_LUMAMAP)]_UseLumaMap("Use Luma Map %ShowIf(_EnableLuma)", Int) = 0
        _LumaMap("Luma Map > %ShowIf(_EnableLuma && _UseLumaMap)", 2D) = "black" {}
        _LumaRotation("Luma Rotation %ShowIf(_EnableLuma && !_UseLumaMap)", Range(-360, 360)) = 0
        _LumaWarp("Luma Warp %ShowIf(_EnableLuma)", Range(0.0, 2.0)) = 1.0
        _LumaBiased("Luma Bias %ShowIf(_EnableLuma)", Range(0.0, 1.0)) = 0.0
        [Enum(Luma History One,0,Luma History Two,1,Luma History Three,2,Luma History Four,3,Luma Gradient One,4,Luma Gradient Two,5,Luma Gradient Three,6)]_LumaGrad1("Luma Gradient 1 %ShowIf(_EnableLuma)", Int) = 4
        [Enum(Luma History One,0,Luma History Two,1,Luma History Three,2,Luma History Four,3,Luma Gradient One,4,Luma Gradient Two,5,Luma Gradient Three,6)]_LumaGrad2("Luma Gradient 2 %ShowIf(_EnableLuma && _UseLumaMap)", Int) = 5
        [Enum(Luma History One,0,Luma History Two,1,Luma History Three,2,Luma History Four,3,Luma Gradient One,4,Luma Gradient Two,5,Luma Gradient Three,6)]_LumaGrad3("Luma Gradient 3 %ShowIf(_EnableLuma && _UseLumaMap)", Int) = 6
        UI_Video_Header("# Video", Int) = 1
        [Toggle(_VIDEO)]_EnableVideo("Enable Video", Int) = 0
        [Toggle(_VIDEOAST)]_ApplyVideoTransform("Apply Video Transform %ShowIf(_EnableVideo)", Int) = 1
        [HDR]_VideoTint("Video Tint %ShowIf(_EnableVideo)", Color) = (1.0, 1.0, 1.0, 1.0)
        [Toggle(_VIDEOALBEDO)]_VideoAsAlbedo("Video As Albedo %ShowIf(_EnableVideo)", Int) = 0
        _VideoMask("Video Mask %ShowIf(_EnableVideo)", 2D) = "white" {}
        _VideoFallback("Video Fallback > %ShowIf(_EnableVideo)", 2D) = "black" {}
        [Toggle(_VIDEOMAP)]_UseVideoMap("Use Video UV Map %ShowIf(_EnableVideo)", Int) = 0
        _VideoMap("Video UV Map > %ShowIf(_EnableVideo && _UseVideoMap)", 2D) = "black" {}
        _VideoRatio("Video Ratio %ShowIf(_EnableVideo && !_UseVideoMap)", Float) = 1.777777
        _VideoRotation("Video Rotation %ShowIf(_EnableVideo && !_UseVideoMap)", Range(-360, 360)) = 0
        UI_Crowdwave_Header("# Crowdwave", Int) = 1
        [Toggle(_CROWDWAVE)]_EnableCrowdwave("Enable Crowdwave", Int) = 0
        [Toggle(_CROWDWAVERANGE)]_CrowdwaveRange("Crowdwave Use Range %ShowIf(_EnableCrowdwave)", Int) = 0
        [HDR]_CrowdwaveTint("Crowdwave Tint %ShowIf(_EnableCrowdwave)", Color) = (1.0, 1.0, 1.0, 1.0)
        _CrowdwaveMask("Crowdwave Mask %ShowIf(_EnableCrowdwave)", 2D) = "white" {}
        _CrowdwaveBias("Crowdwave Bias %ShowIf(_EnableCrowdwave)", Range(0.0, 1.0)) = 0.0
        [ToggleUI]UI_LTCGIHeader ("# LTCGI", Int) = 1
        UI_LTCGIDocs("[This module has documentation](https://shaders.orels.sh/docs/orl-standard/ltcgi)", Int) = 0
        [Toggle(INTEGRATE_LTCGI)]_IntegrateLTCGI("Integrate LTCGI", Int) = 0
        UI_LTCGIDownload("[Make sure to download LTCGI before enabling this option](https://github.com/PiMaker/ltcgi/releases)", Int) = 0
        [ToggleUI]_LTCGIEnableOnMobile("Enable on Mobile", Int) = 0
        UI_LTCGIEnableOnMobileNote("?> LTCGI is pretty heavy for mobile devices, please test your content when enabling this option", Int) = 0
        [ToggleUI]_LTCGIClampBrightness("Clamp Brightness", Int) = 0
        _LTCGIMaxBrightness("Max Brightness %ShowIf(_LTCGIClampBrightness)", Range(0,1)) = 1
        _LTCGIDiffuseIntensity("Diffuse Intensity", Float) = 1
        _LTCGISpecularIntensity("Specular Intensity", Float) = 1
        _LTCGIRoughnessModifier("Roughness Modifier", Range(-1,1)) = 0
        [ToggleUI]_LTCGIAlphaPremultiply("Alpha Premultiply %ShowIf(INTEGRATE_AREALIT)", Float) = 0
        _LTCGIRamp("LTCGI Ramp %Gradient()", 2D) = "grayscaleRamp" {}
        UI_SheenHeader("# Sheen Settings", Int) = 1
        _SheenStrength("Sheen Strength", Range(-3,3)) = 0
        _SheenPower("Sheen Focus", Float) = 2
        [HDR]_SheenTint("Sheen Tint", Color) = (1,1,1,1)
        _SheenAlbedoTint("Albedo Tint", Range(0,1)) = 1
        [Enum(Overlay, 0, Lighten, 1, Screen, 2, Multiply, 3)]_SheenBlendType("Blending Type", Int) = 0
        UI_SheenBlendTypeNote("> The blend types match the ones provided by Photoshop", Int) = 0
        _SheenMask("Sheen Mask", 2D) = "white" {}
        UI_VRCFeaturesHeader("# VRChat Features", Int) = 0
        UI_VRCDocs("[This module has documentation](https://shaders.orels.sh/docs/orl-standard/base-shader#vr-chat-features)", Int) = 0
        [Enum(Standard, 0, Toon, 1, Hidden, 2, Transparent, 3, Cutout, 4, ToonCutout, 5)]_VRCFallbackTag("VRC Fallback %OverrideTag(VRCFallback)", Int) = 0
        [Toggle(VRC_FEATURES)]_VRCFeaturesEnabled("VRChat Features Enabled", Int) = 0
        UI_VRCHideMainViewHeader("## Hide from Main View %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInVR("In VR %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInDesktop("On Desktop %ShowIf(VRC_FEATURES)p", Int) = 0
        UI_VRCHideCameraHeader("## Hide from Handheld Camera %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInVRCamera("In VR %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInDesktopCamera("On Desktop %ShowIf(VRC_FEATURES)", Int) = 0
        UI_VRCHideInMirrorHeader("## Hide from Mirror %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInVRMirror("In VR %ShowIf(VRC_FEATURES)", Int) = 0
        [ToggleUI]_VRCHideInDesktopMirror("On Desktop %ShowIf(VRC_FEATURES)", Int) = 0
        UI_AdvancedSettingsHeader("# Advanced Settings", Int) = 1
        [Enum(UnityEngine.Rendering.CullMode)]_CullMode("Culling Mode", Int) = 2
        _RenderType("Render Type %RenderType(_BlendOp, _SrcBlend, _DstBlend, _BlendOpAlpha, _SrcBlendAlpha, _DstBlendAlpha, _ZWrite)", Float) = -1
        [Enum(UnityEngine.Rendering.BlendOp)]_BlendOp("Blend Operation %ShowIf(_RenderType == 4)", Int) = 0
        [Enum(UnityEngine.Rendering.BlendMode)]_SrcBlend("Source Blend %ShowIf(_RenderType == 4)", Int) = 1
        [Enum(UnityEngine.Rendering.BlendMode)]_DstBlend("Destination Blend %ShowIf(_RenderType == 4)", Int) = 0
        [Enum(UnityEngine.Rendering.BlendOp)]_BlendOpAlpha("Blend Operation Alpha %ShowIf(_RenderType == 4)", Int) = 0
        [Enum(UnityEngine.Rendering.BlendMode)]_SrcBlendAlpha("Source Blend Alpha %ShowIf(_RenderType == 4)", Int) = 1
        [Enum(UnityEngine.Rendering.BlendMode)]_DstBlendAlpha("Destination Blend Alpha %ShowIf(_RenderType == 4)", Int) = 0
        _Cutoff("Cutoff %ShowIf(_RenderType == 1)", Range(0, 1)) = 0.5
        [Enum(Off, 0, On, 1)]_ZWrite("Depth Write", Int) = 1
        [Enum(UnityEngine.Rendering.CompareFunction)]_ZTest("Depth Test", Int) = 4
        [ToggleUI]_IgnoreLightprobeNormal("Uniform Lightprobe Color", Int) = 0
        [ToggleUI]_MinLight("Raise Minimum Light", Int) = 0
        UI_MinLightNote("?> This will raise the minimum light level and make you glow in dark environments. While not accurate to any world lighting, this can be nice to have to take pictures", Int) = 0
        _MonochromeLighting("Monochrome Lighting", Range(0,1)) = 0
        UI_MonochromeLightingNote("?> This will make the environment lighting only control the intensity without affecting the color of your object. This is now physically accurate.", Int) = 0
    }

    SubShader
    {
        Tags { "VRCFallback"="Standard" "RenderType" = "Opaque" "Queue" = "Geometry" "LTCGI" = "_IntegrateLTCGI"  }
        
        ZTest [_ZTest]
        ZWrite [_ZWrite]
        Cull [_CullMode]
        BlendOp [_BlendOp], [_BlendOpAlpha]
        Blend [_SrcBlend] [_DstBlend], [_SrcBlendAlpha] [_DstBlendAlpha]


        // Global Include Start
        CGINCLUDE
        #include "UnityStandardUtils.cginc"
        #include "Lighting.cginc"
        #include "AutoLight.cginc"

        // Sampling Library
        // Sampling Library Module Start
        // com.unity.render-pipelines.core copyright © 2020 Unity Technologies ApS
        //
        // Licensed under the Unity Companion License for Unity-dependent projects--see [Unity Companion License](http://www.unity3d.com/legal/licenses/Unity_Companion_License).
        //
        // Unless expressly provided otherwise, the Software under this license is made available strictly on an “AS IS” BASIS WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED. Please review the license for details on these and other terms and conditions.
        
        // Credit to Jason Booth for digging this all up
        
        // If your looking in here and thinking WTF, yeah, I know. These are taken from the SRPs, to allow us to use the same
        // texturing library they use. However, since they are not included in the standard pipeline by default, there is no
        // way to include them in and they have to be inlined, since someone could copy this shader onto another machine without
        // Better Shaders installed. Unfortunate, but I'd rather do this and have a nice library for texture sampling instead
        // of the patchy one Unity provides being inlined/emulated in HDRP/URP. Strangely, PSSL and XBoxOne libraries are not
        // included in the standard SRP code, but they are in tons of Unity own projects on the web, so I grabbed them from there.
        
        
        #if defined(SHADER_API_XBOXONE)
        
        // Initialize arbitrary structure with zero values.
        // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
        #define ZERO_INITIALIZE(type, name) name = (type)0;
        #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
        // Texture util abstraction
        
        #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
        // Texture abstraction
        
        #define TEXTURE2D(textureName)                Texture2D textureName
        #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
        #define TEXTURECUBE(textureName)              TextureCube textureName
        #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
        #define TEXTURE3D(textureName)                Texture3D textureName
        
        #define TEXTURE2D_FLOAT(textureName)          TEXTURE2D(textureName)
        #define TEXTURE2D_ARRAY_FLOAT(textureName)    TEXTURE2D_ARRAY(textureName)
        #define TEXTURECUBE_FLOAT(textureName)        TEXTURECUBE(textureName)
        #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TEXTURECUBE_ARRAY(textureName)
        #define TEXTURE3D_FLOAT(textureName)          TEXTURE3D(textureName)
        
        #define TEXTURE2D_HALF(textureName)           TEXTURE2D(textureName)
        #define TEXTURE2D_ARRAY_HALF(textureName)     TEXTURE2D_ARRAY(textureName)
        #define TEXTURECUBE_HALF(textureName)         TEXTURECUBE(textureName)
        #define TEXTURECUBE_ARRAY_HALF(textureName)   TEXTURECUBE_ARRAY(textureName)
        #define TEXTURE3D_HALF(textureName)           TEXTURE3D(textureName)
        
        #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
        #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
        #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
        #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
        #define RW_TEXTURE2D(type, textureName)       RWTexture2D<type> textureName
        #define RW_TEXTURE2D_ARRAY(type, textureName) RWTexture2DArray<type> textureName
        #define RW_TEXTURE3D(type, textureName)       RWTexture3D<type> textureName
        
        #define SAMPLER(samplerName)                  SamplerState samplerName
        #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
        #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
        #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
        #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
        #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
        #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
        #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
        #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
        #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
        #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
        #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
        #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
        #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
        #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
        #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
        #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
        #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
        #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
        #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
        #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
        #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
        #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
        #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
        #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
        #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
        #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
        #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
        #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
        #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
        #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
        #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
        #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
        #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
        #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
        #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
        #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
        #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
        #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
        #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
        #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
        #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
        #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
        #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
        #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
        #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
        #define LOAD_TEXTURE3D(textureName, unCoord3)                                   textureName.Load(int4(unCoord3, 0))
        #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                          textureName.Load(int4(unCoord3, lod))
        
        #define PLATFORM_SUPPORT_GATHER
        #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
        #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
        #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
        #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
        #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
        #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
        #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
        #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        
        #elif defined(SHADER_API_PSSL)
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.GetLOD(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
          #define TEXTURECUBE(textureName)              TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
          #define TEXTURE3D(textureName)                Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)          TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_FLOAT(textureName)    TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_FLOAT(textureName)        TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_FLOAT(textureName)          TEXTURE3D(textureName)
        
          #define TEXTURE2D_HALF(textureName)           TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_HALF(textureName)     TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_HALF(textureName)         TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_HALF(textureName)   TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_HALF(textureName)           TEXTURE3D(textureName)
        
          #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)       RW_Texture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName) RW_Texture2D_Array<type> textureName
          #define RW_TEXTURE3D(type, textureName)       RW_Texture3D<type> textureName
        
          #define SAMPLER(samplerName)                  SamplerState samplerName
          #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                   textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                          textureName.Load(int4(unCoord3, lod))
        
          #define PLATFORM_SUPPORT_GATHER
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        
        
        #elif defined(SHADER_API_D3D11)
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
          #define TEXTURECUBE(textureName)              TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
          #define TEXTURE3D(textureName)                Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)          TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_FLOAT(textureName)    TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_FLOAT(textureName)        TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_FLOAT(textureName)          TEXTURE3D(textureName)
        
          #define TEXTURE2D_HALF(textureName)           TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_HALF(textureName)     TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_HALF(textureName)         TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_HALF(textureName)   TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_HALF(textureName)           TEXTURE3D(textureName)
        
          #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)       RWTexture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName) RWTexture2DArray<type> textureName
          #define RW_TEXTURE3D(type, textureName)       RWTexture3D<type> textureName
        
          #define SAMPLER(samplerName)                  SamplerState samplerName
          #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                   textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                          textureName.Load(int4(unCoord3, lod))
        
          #define PLATFORM_SUPPORT_GATHER
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        #elif defined(SHADER_API_METAL)
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
          #define TEXTURECUBE(textureName)              TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
          #define TEXTURE3D(textureName)                Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)          Texture2D_float textureName
          #define TEXTURE2D_ARRAY_FLOAT(textureName)    Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_FLOAT(textureName)        TextureCube_float textureName
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_FLOAT(textureName)          Texture3D_float textureName
        
          #define TEXTURE2D_HALF(textureName)           Texture2D_half textureName
          #define TEXTURE2D_ARRAY_HALF(textureName)     Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_HALF(textureName)         TextureCube_half textureName
          #define TEXTURECUBE_ARRAY_HALF(textureName)   TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_HALF(textureName)           Texture3D_half textureName
        
          #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)       RWTexture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName) RWTexture2DArray<type> textureName
          #define RW_TEXTURE3D(type, textureName)       RWTexture3D<type> textureName
        
          #define SAMPLER(samplerName)                  SamplerState samplerName
          #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                   textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                          textureName.Load(int4(unCoord3, lod))
        
          #define PLATFORM_SUPPORT_GATHER
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        #elif defined(SHADER_API_VULKAN)
          // This file assume SHADER_API_VULKAN is defined
          // TODO: This is a straight copy from D3D11.hlsl. Go through all this stuff and adjust where needed.
        
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
          #define TEXTURECUBE(textureName)              TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
          #define TEXTURE3D(textureName)                Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)          Texture2D_float textureName
          #define TEXTURE2D_ARRAY_FLOAT(textureName)    Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_FLOAT(textureName)        TextureCube_float textureName
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_FLOAT(textureName)          Texture3D_float textureName
        
          #define TEXTURE2D_HALF(textureName)           Texture2D_half textureName
          #define TEXTURE2D_ARRAY_HALF(textureName)     Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_HALF(textureName)         TextureCube_half textureName
          #define TEXTURECUBE_ARRAY_HALF(textureName)   TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_HALF(textureName)           Texture3D_half textureName
        
          #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)       RWTexture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName) RWTexture2DArray<type> textureName
          #define RW_TEXTURE3D(type, textureName)       RWTexture3D<type> textureName
        
          #define SAMPLER(samplerName)                  SamplerState samplerName
          #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                   textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                          textureName.Load(int4(unCoord3, lod))
        
          #define PLATFORM_SUPPORT_GATHER
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        #elif defined(SHADER_API_SWITCH)
          // This file assume SHADER_API_SWITCH is defined
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)          Texture2DArray textureName
          #define TEXTURECUBE(textureName)              TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)        TextureCubeArray textureName
          #define TEXTURE3D(textureName)                Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)          Texture2D_float textureName
          #define TEXTURE2D_ARRAY_FLOAT(textureName)    Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_FLOAT(textureName)        TextureCube_float textureName
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)  TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_FLOAT(textureName)          Texture3D_float textureName
        
          #define TEXTURE2D_HALF(textureName)           Texture2D_half textureName
          #define TEXTURE2D_ARRAY_HALF(textureName)     Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_HALF(textureName)         TextureCube_half textureName
          #define TEXTURECUBE_ARRAY_HALF(textureName)   TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_HALF(textureName)           Texture3D_half textureName
        
          #define TEXTURE2D_SHADOW(textureName)         TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)   TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)       TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName) TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)       RWTexture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName) RWTexture2DArray<type> textureName
          #define RW_TEXTURE3D(type, textureName)       RWTexture3D<type> textureName
        
          #define SAMPLER(samplerName)                  SamplerState samplerName
          #define SAMPLER_CMP(samplerName)              SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, dpdx, dpdy)              textureName.SampleGrad(samplerName, coord2, dpdx, dpdy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                textureName.Sample(samplerName, float4(coord3, index))
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)       textureName.SampleLevel(samplerName, float4(coord3, index), lod)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)     textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                               textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                      textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                    textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)       textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                  textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)     textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                       textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)              textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)     textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)          textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod) textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                       textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)              textureName.Load(int4(unCoord3, lod))
        
          #define PLATFORM_SUPPORT_GATHER
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                textureName.Gather(samplerName, coord2)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)   textureName.Gather(samplerName, float3(coord2, index))
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)              textureName.Gather(samplerName, coord3)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index) textureName.Gather(samplerName, float4(coord3, index))
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherRed(samplerName, coord2)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherGreen(samplerName, coord2)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)           textureName.GatherBlue(samplerName, coord2)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)          textureName.GatherAlpha(samplerName, coord2)
        
        #elif defined(SHADER_API_GLCORE)
        
          // OpenGL 4.1 SM 5.0 https://docs.unity3d.com/Manual/SL-ShaderCompileTargets.html
          #if (SHADER_TARGET >= 46)
            #define OPENGL4_1_SM5 1
          #else
            #define OPENGL4_1_SM5 0
          #endif
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                  Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)            Texture2DArray textureName
          #define TEXTURECUBE(textureName)                TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)          TextureCubeArray textureName
          #define TEXTURE3D(textureName)                  Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)            TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_FLOAT(textureName)      TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_FLOAT(textureName)          TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)    TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_FLOAT(textureName)            TEXTURE3D(textureName)
        
          #define TEXTURE2D_HALF(textureName)             TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_HALF(textureName)       TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_HALF(textureName)           TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_HALF(textureName)     TEXTURECUBE_ARRAY(textureName)
          #define TEXTURE3D_HALF(textureName)             TEXTURE3D(textureName)
        
          #define TEXTURE2D_SHADOW(textureName)           TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)     TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)         TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName)   TEXTURECUBE_ARRAY(textureName)
        
          #define RW_TEXTURE2D(type, textureName)         RWTexture2D<type> textureName
          #define RW_TEXTURE2D_ARRAY(type, textureName)   RWTexture2DArray<type> textureName
          #define RW_TEXTURE3D(type, textureName)         RWTexture3D<type> textureName
        
          #define SAMPLER(samplerName)                    SamplerState samplerName
          #define SAMPLER_CMP(samplerName)                SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, ddx, ddy)                textureName.SampleGrad(samplerName, coord2, ddx, ddy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
          #ifdef UNITY_NO_CUBEMAP_ARRAY
            #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)           ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY)
            #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)  ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_LOD)
            #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, bias) ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_LOD)
          #else
            #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)           textureName.Sample(samplerName, float4(coord3, index))
            #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)  textureName.SampleLevel(samplerName, float4(coord3, index), lod)
            #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #endif
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                          textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                 textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                   textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)      textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                 textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)    textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                   textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                          textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                 textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                      textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)    textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)             textureName.Load(int4(unCoord2, index, lod))
        
          #if OPENGL4_1_SM5
            #define PLATFORM_SUPPORT_GATHER
            #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                  textureName.Gather(samplerName, coord2)
            #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)     textureName.Gather(samplerName, float3(coord2, index))
            #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)                textureName.Gather(samplerName, coord3)
            #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)   textureName.Gather(samplerName, float4(coord3, index))
          #else
            #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                  ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D)
            #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)     ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D_ARRAY)
            #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)                ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE)
            #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)   ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE_ARRAY)
          #endif
        
        
        #elif defined(SHADER_API_GLES3)
        
          // GLES 3.1 + AEP shader feature https://docs.unity3d.com/Manual/SL-ShaderCompileTargets.html
          #if (SHADER_TARGET >= 40)
            #define GLES3_1_AEP 1
          #else
            #define GLES3_1_AEP 0
          #endif
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) textureName.CalculateLevelOfDetail(samplerName, coord2)
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                  Texture2D textureName
          #define TEXTURE2D_ARRAY(textureName)            Texture2DArray textureName
          #define TEXTURECUBE(textureName)                TextureCube textureName
          #define TEXTURECUBE_ARRAY(textureName)          TextureCubeArray textureName
          #define TEXTURE3D(textureName)                  Texture3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)            Texture2D_float textureName
          #define TEXTURE2D_ARRAY_FLOAT(textureName)      Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_FLOAT(textureName)          TextureCube_float textureName
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)    TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_FLOAT(textureName)            Texture3D_float textureName
        
          #define TEXTURE2D_HALF(textureName)             Texture2D_half textureName
          #define TEXTURE2D_ARRAY_HALF(textureName)       Texture2DArray textureName    // no support to _float on Array, it's being added
          #define TEXTURECUBE_HALF(textureName)           TextureCube_half textureName
          #define TEXTURECUBE_ARRAY_HALF(textureName)     TextureCubeArray textureName  // no support to _float on Array, it's being added
          #define TEXTURE3D_HALF(textureName)             Texture3D_half textureName
        
          #define TEXTURE2D_SHADOW(textureName)           TEXTURE2D(textureName)
          #define TEXTURE2D_ARRAY_SHADOW(textureName)     TEXTURE2D_ARRAY(textureName)
          #define TEXTURECUBE_SHADOW(textureName)         TEXTURECUBE(textureName)
          #define TEXTURECUBE_ARRAY_SHADOW(textureName)   TEXTURECUBE_ARRAY(textureName)
        
          #if GLES3_1_AEP
            #define RW_TEXTURE2D(type, textureName)         RWTexture2D<type> textureName
            #define RW_TEXTURE2D_ARRAY(type, textureName)   RWTexture2DArray<type> textureName
            #define RW_TEXTURE3D(type, textureName)         RWTexture3D<type> textureName
          #else
            #define RW_TEXTURE2D(type, textureName)         ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture2D)
            #define RW_TEXTURE2D_ARRAY(type, textureName)   ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture2DArray)
            #define RW_TEXTURE3D(type, textureName)         ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture3D)
          #endif
        
          #define SAMPLER(samplerName)                    SamplerState samplerName
          #define SAMPLER_CMP(samplerName)                SamplerComparisonState samplerName
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                 TEXTURE2D(textureName), SAMPLER(samplerName)
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)           TEXTURE2D_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_PARAM(textureName, samplerName)               TEXTURECUBE(textureName), SAMPLER(samplerName)
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)         TEXTURECUBE_ARRAY(textureName), SAMPLER(samplerName)
          #define TEXTURE3D_PARAM(textureName, samplerName)                 TEXTURE3D(textureName), SAMPLER(samplerName)
        
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)          TEXTURE2D(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)    TEXTURE2D_ARRAY(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)        TEXTURECUBE(textureName), SAMPLER_CMP(samplerName)
          #define TEXTURECUBE_ARRAY_SHADOW_PARAM(textureName, samplerName)  TEXTURECUBE_ARRAY(textureName), SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_ARGS(textureName, samplerName)                textureName, samplerName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)          textureName, samplerName
          #define TEXTURECUBE_ARGS(textureName, samplerName)              textureName, samplerName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)        textureName, samplerName
          #define TEXTURE3D_ARGS(textureName, samplerName)                textureName, samplerName
        
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)         textureName, samplerName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)   textureName, samplerName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)       textureName, samplerName
          #define TEXTURECUBE_ARRAY_SHADOW_ARGS(textureName, samplerName) textureName, samplerName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2)                               textureName.Sample(samplerName, coord2)
          #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)                      textureName.SampleLevel(samplerName, coord2, lod)
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                    textureName.SampleBias(samplerName, coord2, bias)
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, ddx, ddy)                textureName.SampleGrad(samplerName, coord2, ddx, ddy)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                  textureName.Sample(samplerName, float3(coord2, index))
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)         textureName.SampleLevel(samplerName, float3(coord2, index), lod)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)       textureName.SampleBias(samplerName, float3(coord2, index), bias)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy) textureName.SampleGrad(samplerName, float3(coord2, index), dpdx, dpdy)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                             textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                    textureName.SampleLevel(samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                  textureName.SampleBias(samplerName, coord3, bias)
        
          #ifdef UNITY_NO_CUBEMAP_ARRAY
            #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)           ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY)
            #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)  ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_LOD)
            #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_BIAS)
          #else
            #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)           textureName.Sample(samplerName, float4(coord3, index))
            #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)  textureName.SampleLevel(samplerName, float4(coord3, index), lod)
            #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)textureName.SampleBias(samplerName, float4(coord3, index), bias)
          #endif
        
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                          textureName.Sample(samplerName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                 textureName.SampleLevel(samplerName, coord3, lod)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                   textureName.SampleCmpLevelZero(samplerName, (coord3).xy, (coord3).z)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)      textureName.SampleCmpLevelZero(samplerName, float3((coord3).xy, index), (coord3).z)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                 textureName.SampleCmpLevelZero(samplerName, (coord4).xyz, (coord4).w)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)    textureName.SampleCmpLevelZero(samplerName, float4((coord4).xyz, index), (coord4).w)
        
        
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                       textureName.Load(int3(unCoord2, 0))
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                              textureName.Load(int3(unCoord2, lod))
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                     textureName.Load(unCoord2, sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                          textureName.Load(int4(unCoord2, index, 0))
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)        textureName.Load(int3(unCoord2, index), sampleIndex)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)                 textureName.Load(int4(unCoord2, index, lod))
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                       textureName.Load(int4(unCoord3, 0))
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                              textureName.Load(int4(unCoord3, lod))
        
          #if GLES3_1_AEP
            #define PLATFORM_SUPPORT_GATHER
            #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                  textureName.Gather(samplerName, coord2)
            #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)     textureName.Gather(samplerName, float3(coord2, index))
            #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)                textureName.Gather(samplerName, coord3)
            #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)   textureName.Gather(samplerName, float4(coord3, index))
            #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)              textureName.GatherRed(samplerName, coord2)
            #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherGreen(samplerName, coord2)
            #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)             textureName.GatherBlue(samplerName, coord2)
            #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)            textureName.GatherAlpha(samplerName, coord2)
          #else
            #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                  ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D)
            #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)     ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D_ARRAY)
            #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)                ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE)
            #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)   ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE_ARRAY)
            #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)              ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_RED_TEXTURE2D)
            #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)            ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_GREEN_TEXTURE2D)
            #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)             ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_BLUE_TEXTURE2D)
            #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)            ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_ALPHA_TEXTURE2D)
          #endif
        
        
        #elif defined(SHADER_API_GLES)
        
        
          #define uint int
        
          #define rcp(x) 1.0 / (x)
          #define ddx_fine ddx
          #define ddy_fine ddy
          #define asfloat
          #define asuint(x) asint(x)
          #define f32tof16
          #define f16tof32
        
          #define ERROR_ON_UNSUPPORTED_FUNCTION(funcName) #error #funcName is not supported on GLES 2.0
        
          // Initialize arbitrary structure with zero values.
          // Do not exist on some platform, in this case we need to have a standard name that call a function that will initialize all parameters to 0
          #define ZERO_INITIALIZE(type, name) name = (type)0;
          #define ZERO_INITIALIZE_ARRAY(type, name, arraySize) { for (int arrayIndex = 0; arrayIndex < arraySize; arrayIndex++) { name[arrayIndex] = (type)0; } }
        
        
          // Texture util abstraction
        
          #define CALCULATE_TEXTURE2D_LOD(textureName, samplerName, coord2) #error calculate Level of Detail not supported in GLES2
        
          // Texture abstraction
        
          #define TEXTURE2D(textureName)                          sampler2D textureName
          #define TEXTURE2D_ARRAY(textureName)                    samplerCUBE textureName // No support to texture2DArray
          #define TEXTURECUBE(textureName)                        samplerCUBE textureName
          #define TEXTURECUBE_ARRAY(textureName)                  samplerCUBE textureName // No supoport to textureCubeArray and can't emulate with texture2DArray
          #define TEXTURE3D(textureName)                          sampler3D textureName
        
          #define TEXTURE2D_FLOAT(textureName)                    sampler2D_float textureName
          #define TEXTURE2D_ARRAY_FLOAT(textureName)              TEXTURECUBE_FLOAT(textureName) // No support to texture2DArray
          #define TEXTURECUBE_FLOAT(textureName)                  samplerCUBE_float textureName
          #define TEXTURECUBE_ARRAY_FLOAT(textureName)            TEXTURECUBE_FLOAT(textureName) // No support to textureCubeArray
          #define TEXTURE3D_FLOAT(textureName)                    sampler3D_float textureName
        
          #define TEXTURE2D_HALF(textureName)                     sampler2D_half textureName
          #define TEXTURE2D_ARRAY_HALF(textureName)               TEXTURECUBE_HALF(textureName) // No support to texture2DArray
          #define TEXTURECUBE_HALF(textureName)                   samplerCUBE_half textureName
          #define TEXTURECUBE_ARRAY_HALF(textureName)             TEXTURECUBE_HALF(textureName) // No support to textureCubeArray
          #define TEXTURE3D_HALF(textureName)                     sampler3D_half textureName
        
          #define TEXTURE2D_SHADOW(textureName)                   SHADOW2D_TEXTURE_AND_SAMPLER textureName
          #define TEXTURE2D_ARRAY_SHADOW(textureName)             TEXTURECUBE_SHADOW(textureName) // No support to texture array
          #define TEXTURECUBE_SHADOW(textureName)                 SHADOWCUBE_TEXTURE_AND_SAMPLER textureName
          #define TEXTURECUBE_ARRAY_SHADOW(textureName)           TEXTURECUBE_SHADOW(textureName) // No support to texture array
        
          #define RW_TEXTURE2D(type, textureNam)                  ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture2D)
          #define RW_TEXTURE2D_ARRAY(type, textureName)           ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture2DArray)
          #define RW_TEXTURE3D(type, textureNam)                  ERROR_ON_UNSUPPORTED_FUNCTION(RWTexture3D)
        
          #define SAMPLER(samplerName)
          #define SAMPLER_CMP(samplerName)
        
          #define TEXTURE2D_PARAM(textureName, samplerName)                sampler2D textureName
          #define TEXTURE2D_ARRAY_PARAM(textureName, samplerName)          samplerCUBE textureName
          #define TEXTURECUBE_PARAM(textureName, samplerName)              samplerCUBE textureName
          #define TEXTURECUBE_ARRAY_PARAM(textureName, samplerName)        samplerCUBE textureName
          #define TEXTURE3D_PARAM(textureName, samplerName)                sampler3D textureName
          #define TEXTURE2D_SHADOW_PARAM(textureName, samplerName)         SHADOW2D_TEXTURE_AND_SAMPLER textureName
          #define TEXTURE2D_ARRAY_SHADOW_PARAM(textureName, samplerName)   SHADOWCUBE_TEXTURE_AND_SAMPLER textureName
          #define TEXTURECUBE_SHADOW_PARAM(textureName, samplerName)       SHADOWCUBE_TEXTURE_AND_SAMPLER textureName
        
          #define TEXTURE2D_ARGS(textureName, samplerName)               textureName
          #define TEXTURE2D_ARRAY_ARGS(textureName, samplerName)         textureName
          #define TEXTURECUBE_ARGS(textureName, samplerName)             textureName
          #define TEXTURECUBE_ARRAY_ARGS(textureName, samplerName)       textureName
          #define TEXTURE3D_ARGS(textureName, samplerName)               textureName
          #define TEXTURE2D_SHADOW_ARGS(textureName, samplerName)        textureName
          #define TEXTURE2D_ARRAY_SHADOW_ARGS(textureName, samplerName)  textureName
          #define TEXTURECUBE_SHADOW_ARGS(textureName, samplerName)      textureName
        
          #define SAMPLE_TEXTURE2D(textureName, samplerName, coord2) tex2D(textureName, coord2)
        
          #if (SHADER_TARGET >= 30)
            #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod) tex2Dlod(textureName, float4(coord2, 0, lod))
          #else
            // No lod support. Very poor approximation with bias.
            #define SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod) SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, lod)
          #endif
        
          #define SAMPLE_TEXTURE2D_BIAS(textureName, samplerName, coord2, bias)                       tex2Dbias(textureName, float4(coord2, 0, bias))
          #define SAMPLE_TEXTURE2D_GRAD(textureName, samplerName, coord2, ddx, ddy)                   SAMPLE_TEXTURE2D(textureName, samplerName, coord2)
          #define SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)                     ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE2D_ARRAY)
          #define SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, index, lod)            ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE2D_ARRAY_LOD)
          #define SAMPLE_TEXTURE2D_ARRAY_BIAS(textureName, samplerName, coord2, index, bias)          ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE2D_ARRAY_BIAS)
          #define SAMPLE_TEXTURE2D_ARRAY_GRAD(textureName, samplerName, coord2, index, dpdx, dpdy)    ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE2D_ARRAY_GRAD)
          #define SAMPLE_TEXTURECUBE(textureName, samplerName, coord3)                                texCUBE(textureName, coord3)
          // No lod support. Very poor approximation with bias.
          #define SAMPLE_TEXTURECUBE_LOD(textureName, samplerName, coord3, lod)                       SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, lod)
          #define SAMPLE_TEXTURECUBE_BIAS(textureName, samplerName, coord3, bias)                     texCUBEbias(textureName, float4(coord3, bias))
          #define SAMPLE_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)                   ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY)
          #define SAMPLE_TEXTURECUBE_ARRAY_LOD(textureName, samplerName, coord3, index, lod)          ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_LOD)
          #define SAMPLE_TEXTURECUBE_ARRAY_BIAS(textureName, samplerName, coord3, index, bias)        ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_BIAS)
          #define SAMPLE_TEXTURE3D(textureName, samplerName, coord3)                                  tex3D(textureName, coord3)
          #define SAMPLE_TEXTURE3D_LOD(textureName, samplerName, coord3, lod)                         ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE3D_LOD)
        
          #define SAMPLE_TEXTURE2D_SHADOW(textureName, samplerName, coord3)                           SHADOW2D_SAMPLE(textureName, samplerName, coord3)
          #define SAMPLE_TEXTURE2D_ARRAY_SHADOW(textureName, samplerName, coord3, index)              ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURE2D_ARRAY_SHADOW)
          #define SAMPLE_TEXTURECUBE_SHADOW(textureName, samplerName, coord4)                         SHADOWCUBE_SAMPLE(textureName, samplerName, coord4)
          #define SAMPLE_TEXTURECUBE_ARRAY_SHADOW(textureName, samplerName, coord4, index)            ERROR_ON_UNSUPPORTED_FUNCTION(SAMPLE_TEXTURECUBE_ARRAY_SHADOW)
        
        
          // Not supported. Can't define as error because shader library is calling these functions.
          #define LOAD_TEXTURE2D(textureName, unCoord2)                                               half4(0, 0, 0, 0)
          #define LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)                                      half4(0, 0, 0, 0)
          #define LOAD_TEXTURE2D_MSAA(textureName, unCoord2, sampleIndex)                             half4(0, 0, 0, 0)
          #define LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, index)                                  half4(0, 0, 0, 0)
          #define LOAD_TEXTURE2D_ARRAY_MSAA(textureName, unCoord2, index, sampleIndex)                half4(0, 0, 0, 0)
          #define LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, index, lod)                         half4(0, 0, 0, 0)
          #define LOAD_TEXTURE3D(textureName, unCoord3)                                               ERROR_ON_UNSUPPORTED_FUNCTION(LOAD_TEXTURE3D)
          #define LOAD_TEXTURE3D_LOD(textureName, unCoord3, lod)                                      ERROR_ON_UNSUPPORTED_FUNCTION(LOAD_TEXTURE3D_LOD)
        
          // Gather not supported. Fallback to regular texture sampling.
          #define GATHER_TEXTURE2D(textureName, samplerName, coord2)                  ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D)
          #define GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, index)     ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURE2D_ARRAY)
          #define GATHER_TEXTURECUBE(textureName, samplerName, coord3)                ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE)
          #define GATHER_TEXTURECUBE_ARRAY(textureName, samplerName, coord3, index)   ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_TEXTURECUBE_ARRAY)
          #define GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)              ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_RED_TEXTURE2D)
          #define GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)            ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_GREEN_TEXTURE2D)
          #define GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)             ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_BLUE_TEXTURE2D)
          #define GATHER_ALPHA_TEXTURE2D(textureName, samplerName, coord2)            ERROR_ON_UNSUPPORTED_FUNCTION(GATHER_ALPHA_TEXTURE2D)
        
        #else
            #error unsupported shader api
        #endif
        // Sampling Library Module End
        
        
        #ifndef UNITY_BRANCH
            #define UNITY_BRANCH
        #endif
        #ifndef UNITY_FLATTEN
            #define UNITY_FLATTEN
        #endif
        #ifndef UNITY_UNROLL
            #define UNITY_UNROLL
        #endif
        #ifndef UNITY_UNROLLX
            #define UNITY_UNROLLX(_x)
        #endif
        #ifndef UNITY_LOOP
            #define UNITY_LOOP
        #endif
        // Library Functions
        #ifndef AUDIOLINK_CGINC_INCLUDED
            #define AUDIOLINK_CGINC_INCLUDED
        
            // Map of where features in AudioLink are.
            #define ALPASS_DFT                      uint2(0,4)  //Size: 128, 2
            #define ALPASS_WAVEFORM                 uint2(0,6)  //Size: 128, 16
            #define ALPASS_AUDIOLINK                uint2(0,0)  //Size: 128, 4
            #define ALPASS_AUDIOBASS                uint2(0,0)  //Size: 128, 1
            #define ALPASS_AUDIOLOWMIDS             uint2(0,1)  //Size: 128, 1
            #define ALPASS_AUDIOHIGHMIDS            uint2(0,2)  //Size: 128, 1
            #define ALPASS_AUDIOTREBLE              uint2(0,3)  //Size: 128, 1
            #define ALPASS_AUDIOLINKHISTORY         uint2(1,0)  //Size: 127, 4
            #define ALPASS_GENERALVU                uint2(0,22) //Size: 12, 1
            #define ALPASS_GENERALVU_INSTANCE_TIME  uint2(2,22)
            #define ALPASS_GENERALVU_LOCAL_TIME     uint2(3,22)
            #define ALPASS_GENERALVU_NETWORK_TIME   uint2(4,22)
            #define ALPASS_GENERALVU_PLAYERINFO     uint2(6,22)
            #define ALPASS_THEME_COLOR0             uint2(0,23)
            #define ALPASS_THEME_COLOR1             uint2(1,23)
            #define ALPASS_THEME_COLOR2             uint2(2,23)
            #define ALPASS_THEME_COLOR3             uint2(3,23)
            #define ALPASS_GENERALVU_UNIX_DAYS      uint2(5,23)
            #define ALPASS_GENERALVU_UNIX_SECONDS   uint2(6,23)
            #define ALPASS_GENERALVU_SOURCE_POS     uint2(7,23)
            #define ALPASS_MEDIASTATE               uint2(5,22)
        
            #define ALPASS_CCINTERNAL               uint2(12,22) //Size: 12, 2
            #define ALPASS_CCCOLORS                 uint2(25,22) //Size: 12, 1 (Note Color #0 is always black, Colors start at 1)
            #define ALPASS_CCSTRIP                  uint2(0,24)  //Size: 128, 1
            #define ALPASS_CCLIGHTS                 uint2(0,25)  //Size: 128, 2
            #define ALPASS_AUTOCORRELATOR           uint2(0,27)  //Size: 128, 1
            #define ALPASS_FILTEREDAUDIOLINK        uint2(0,28)  //Size: 16, 4
            #define ALPASS_CHRONOTENSITY            uint2(16,28) //Size: 8, 4
            #define ALPASS_FILTEREDVU               uint2(24,28) //Size: 4, 4
            #define ALPASS_FILTEREDVU_INTENSITY     uint2(24,28) //Size: 4, 1
            #define ALPASS_FILTEREDVU_MARKER        uint2(24,29) //Size: 4, 1
            #define ALPASS_GLOBAL_STRINGS           uint2(40,28) //Size: 8, 4
        
            // Some basic constants to use (Note, these should be compatible with
            // future version of AudioLink, but may change.
            #define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
            #define AUDIOLINK_SAMPLEDATA24          2046
            #define AUDIOLINK_EXPBINS               24
            #define AUDIOLINK_EXPOCT                10
            #define AUDIOLINK_ETOTALBINS            (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
            #define AUDIOLINK_WIDTH                 128
            #define AUDIOLINK_SPS                   48000       // Samples per second
            #define AUDIOLINK_ROOTNOTE              0
            #define AUDIOLINK_4BAND_FREQFLOOR       0.123
            #define AUDIOLINK_4BAND_FREQCEILING     1
            #define AUDIOLINK_BOTTOM_FREQUENCY      13.75
            #define AUDIOLINK_BASE_AMPLITUDE        2.5
            #define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
            #define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
            #define AUDIOLINK_DFT_Q                 4.0
            #define AUDIOLINK_TREBLE_CORRECTION     5.0
            #define AUDIOLINK_4BAND_TARGET_RATE     90.0
        
            // Text constants
            #define AUDIOLINK_STRING_MAX_CHARS      32
            #define AUDIOLINK_STRING_LOCALPLAYER    0
            #define AUDIOLINK_STRING_MASTER         1
            #define AUDIOLINK_STRING_CUSTOM1        2
            #define AUDIOLINK_STRING_CUSTOM2        3
        
            // ColorChord constants
            #define COLORCHORD_EMAXBIN              192
            #define COLORCHORD_NOTE_CLOSEST         3.0
            #define COLORCHORD_NEW_NOTE_GAIN        8.0
            #define COLORCHORD_MAX_NOTES            10
        
            // We use glsl_mod for most calculations because it behaves better
            // on negative numbers, and in some situations actually outperforms
            // HLSL's modf().
            #ifndef glsl_mod
                #define glsl_mod(x,y) (((x)-(y)*floor((x)/(y))))
            #endif
        
            uniform float4               _AudioTexture_TexelSize;
        
            #ifdef SHADER_TARGET_SURFACE_ANALYSIS
                #define AUDIOLINK_STANDARD_INDEXING
            #endif
        
            // Mechanism to index into texture.
            #ifdef AUDIOLINK_STANDARD_INDEXING
                sampler2D _AudioTexture;
                #define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
            #else
                uniform Texture2D<float4>   _AudioTexture;
                #define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
            #endif
        
            // Convenient mechanism to read from the AudioLink texture that handles reading off the end of one line and onto the next above it.
            float4 AudioLinkDataMultiline(uint2 xycoord) { return AudioLinkData(uint2(xycoord.x % AUDIOLINK_WIDTH, xycoord.y + xycoord.x/AUDIOLINK_WIDTH)); }
        
            // Mechanism to sample between two adjacent pixels and lerp between them, like "linear" supesampling
            float4 AudioLinkLerp(float2 xy) { return lerp( AudioLinkData(xy), AudioLinkData(xy+int2(1,0)), frac( xy.x ) ); }
        
            // Same as AudioLinkLerp but properly handles multiline reading.
            float4 AudioLinkLerpMultiline(float2 xy) { return lerp(AudioLinkDataMultiline(xy), AudioLinkDataMultiline(xy+float2(1,0)), frac(xy.x)); }
        
            //Tests to see if Audio Link texture is available
            bool AudioLinkIsAvailable()
            {
                #if !defined(AUDIOLINK_STANDARD_INDEXING)
                    int width, height;
                    _AudioTexture.GetDimensions(width, height);
                    return width > 16;
                #else
                    return _AudioTexture_TexelSize.z > 16;
                #endif
            }
        
            // DEPRECATED! Use AudioLinkGetVersionMajor and AudioLinkGetVersionMinor() instead.
            //Get version of audiolink present in the world, 0 if no audiolink is present
            float AudioLinkGetVersion()
            {
                int2 dims;
                #if !defined(AUDIOLINK_STANDARD_INDEXING)
                    _AudioTexture.GetDimensions(dims.x, dims.y);
                #else
                    dims = _AudioTexture_TexelSize.zw;
                #endif
        
                if (dims.x >= 128)
                    return AudioLinkData(ALPASS_GENERALVU).x;
                else if (dims.x > 16)
                    return 1;
                else
                    return 0;
            }
        
            float AudioLinkGetVersionMajor()
            {
                return AudioLinkData(ALPASS_GENERALVU).y;
            }
        
            float AudioLinkGetVersionMinor()
            {
                // If the major version is 1 or greater, we are using the new versioning system.
                if (AudioLinkGetVersionMajor() > 0)
                {
                    return AudioLinkData(ALPASS_GENERALVU).w;
                }
                // Otherwise, defer to the old logic for determining version.
                else
                {
                    int2 dims;
                    #if !defined(AUDIOLINK_STANDARD_INDEXING)
                        _AudioTexture.GetDimensions(dims.x, dims.y);
                    #else
                        dims = _AudioTexture_TexelSize.zw;
                    #endif
        
                    if (dims.x >= 128)
                        return AudioLinkData(ALPASS_GENERALVU).x;
                    else if (dims.x > 16)
                        return 1;
                    else
                        return 0;
                }
            }
        
            // This pulls data from this texture.
            #define AudioLinkGetSelfPixelData(xy) _SelfTexture2D[xy]
        
            // Extra utility functions for time.
            uint AudioLinkDecodeDataAsUInt(uint2 indexloc)
            {
                uint4 rpx = AudioLinkData(indexloc);
                return rpx.x + rpx.y*1024 + rpx.z * 1048576 + rpx.w * 1073741824;
            }
        
            //Note: This will truncate time to every 134,217.728 seconds (~1.5 days of an instance being up) to prevent floating point aliasing.
            // if your code will alias sooner, you will need to use a different function.  It should be safe to use this on all times.
            float AudioLinkDecodeDataAsSeconds(uint2 indexloc)
            {
                uint time = AudioLinkDecodeDataAsUInt(indexloc) & 0x7ffffff;
                //Can't just divide by float.  Bug in Unity's HLSL compiler.
                return float(time / 1000) + float( time % 1000 ) / 1000.; 
            }
        
            #define ALDecodeDataAsSeconds( x ) AudioLinkDecodeDataAsSeconds( x )
            #define ALDecodeDataAsUInt( x ) AudioLinkDecodeDataAsUInt( x )
        
            float AudioLinkRemap(float t, float a, float b, float u, float v) { return ((t-a) / (b-a)) * (v-u) + u; }
        
            float3 AudioLinkHSVtoRGB(float3 HSV)
            {
                float3 RGB = 0;
                float C = HSV.z * HSV.y;
                float H = HSV.x * 6;
                float X = C * (1 - abs(fmod(H, 2) - 1));
                if (HSV.y != 0)
                {
                    float I = floor(H);
                    if (I == 0) { RGB = float3(C, X, 0); }
                    else if (I == 1) { RGB = float3(X, C, 0); }
                    else if (I == 2) { RGB = float3(0, C, X); }
                    else if (I == 3) { RGB = float3(0, X, C); }
                    else if (I == 4) { RGB = float3(X, 0, C); }
                    else { RGB = float3(C, 0, X); }
                }
                float M = HSV.z - C;
                return RGB + M;
            }
        
            float3 AudioLinkCCtoRGB(float bin, float intensity, int rootNote)
            {
                float note = bin / AUDIOLINK_EXPBINS;
        
                float hue = 0.0;
                note *= 12.0;
                note = glsl_mod(4. - note + rootNote, 12.0);
                {
                    if(note < 4.0)
                    {
                        //Needs to be YELLOW->RED
                        hue = (note) / 24.0;
                    }
                    else if(note < 8.0)
                    {
                        //            [4]  [8]
                        //Needs to be RED->BLUE
                        hue = (note-2.0) / 12.0;
                    }
                    else
                    {
                        //             [8] [12]
                        //Needs to be BLUE->YELLOW
                        hue = (note - 4.0) / 8.0;
                    }
                }
                float val = intensity - 0.1;
                return AudioLinkHSVtoRGB(float3(fmod(hue, 1.0), 1.0, clamp(val, 0.0, 1.0)));
            }
        
            // Sample the amplitude of a given frequency in the DFT, supports frequencies in [13.75; 14080].
            float4 AudioLinkGetAmplitudeAtFrequency(float hertz)
            {
                float note = AUDIOLINK_EXPBINS * log2(hertz / AUDIOLINK_BOTTOM_FREQUENCY);
                return AudioLinkLerpMultiline(ALPASS_DFT + float2(note, 0));
            }
        
            // Sample the amplitude of a given quartertone in an octave. Octave is in [0; 9] while quarter is [0; 23].
            float4 AudioLinkGetAmplitudeAtQuarterNote(float octave, float quarter)
            {
                return AudioLinkLerpMultiline(ALPASS_DFT + float2(octave * AUDIOLINK_EXPBINS + quarter, 0));
            }
        
            // Sample the amplitude of a given semitone in an octave. Octave is in [0; 9] while note is [0; 11].
            float4 AudioLinkGetAmplitudeAtNote(float octave, float note)
            {
                float quarter = note * 2.0;
                return AudioLinkGetAmplitudeAtQuarterNote(octave, quarter);
            }
        
            // Sample the amplitude of a given quartertone across all octaves. Quarter is [0; 23].
            float4 AudioLinkGetAmplitudesAtQuarterNote(float quarter)
            {
                float amplitude = 0;
                UNITY_UNROLL
                for (int i = 0; i < AUDIOLINK_EXPOCT; i++)
                {
                    amplitude += AudioLinkGetAmplitudeAtQuarterNote(i,quarter);
                }
                return amplitude;
            }
        
            // Sample the amplitude of a given semitone across all octaves. Note is [0; 11].
            float4 AudioLinkGetAmplitudesAtNote(float note)
            {
                float quarter = note * 2.0;
                return AudioLinkGetAmplitudesAtQuarterNote(quarter);
            }
        
            // Get a reasonable drop-in replacement time value for _Time.y with the
            // given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTime(uint index, uint band)
            {
                return (AudioLinkDecodeDataAsUInt(ALPASS_CHRONOTENSITY + uint2(index, band))) / 100000.0;
            }
        
            // Get a chronotensity value in the interval [0; 1], modulated by the speed input, 
            // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTimeNormalized(uint index, uint band, float speed)
            {
                return frac(AudioLinkGetChronoTime(index, band) * speed);
            }
        
            // Get a chronotensity value in the interval [0; interval], modulated by the speed input, 
            // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTimeInterval(uint index, uint band, float speed, float interval)
            {
                return AudioLinkGetChronoTimeNormalized(index, band, speed) * interval;
            }
        
            // Get time of day. The return value is a float4 with the values float3(hour, minute, second).
            float3 AudioLinkGetTimeOfDay()
            {
                float value = AudioLinkDecodeDataAsSeconds(ALPASS_GENERALVU_UNIX_SECONDS);
                float hour = floor(value / 3600.0);
                float minute = floor(value / 60.0) % 60.0;
                float second = value % 60.0;
                return float3(hour, minute, second);
            }
        
            // Get a character from a globally synced string, given an index of string in range [0; 3], and
            // a character index in range [0; 31]. The string at the 0th index is the local player name.
            // The 1st index is the master name, and index 2 and 3 are custom strings.
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetGlobalStringChar(uint stringIndex, uint charIndex)
            {
                uint4 fourChars = asuint(AudioLinkData(ALPASS_GLOBAL_STRINGS + uint2(charIndex / 4, stringIndex)));
                return fourChars[charIndex % 4];
            }
        
            // Get a character from the local player name given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetLocalPlayerNameChar(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_LOCALPLAYER, charIndex);
            }
        
            // Get a character from the master player name given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetMasterNameChar(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_MASTER, charIndex);
            }
        
            // Get a character from the first custom string given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetCustomString1Char(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_CUSTOM1, charIndex);
            }
        
            // Get a character from the second custom string given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetCustomString2Char(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_CUSTOM2, charIndex);
            }
        
            // Returns the position of the AudioLink AudioSource in world space.
            float4 AudioLinkGetAudioSourcePosition()
            {
                return float4(AudioLinkData(ALPASS_GENERALVU_SOURCE_POS).xyz,1);
            }
        #endif
        
        //--------------------------------------------------------------
        // Macros to redefine built-in macros to those used by the URP
        //--------------------------------------------------------------
        
        #if !defined(BIRP_TO_URP)
        #define BIRP_TO_URP
        
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        // StdLib.hlsl ----------------------------------------------------------------
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        
        #define HALF_MAX        65504.0 // (2 - 2^-10) * 2^15
        #define HALF_MAX_MINUS1 65472.0 // (2 - 2^-9) * 2^15
        #define EPSILON         1.0e-4
        #define PI              3.14159265359
        #define TWO_PI          6.28318530718
        #define FOUR_PI         12.56637061436
        #define INV_PI          0.31830988618
        #define INV_TWO_PI      0.15915494309
        #define INV_FOUR_PI     0.07957747155
        #define HALF_PI         1.57079632679
        #define INV_HALF_PI     0.636619772367
        
        #define FLT_EPSILON     1.192092896e-07 // Smallest positive number, such that 1.0 + FLT_EPSILON != 1.0
        #define FLT_MIN         1.175494351e-38 // Minimum representable positive floating-point number
        #define FLT_MAX         3.402823466e+38 // Maximum representable floating-point number
        
        
        
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        // Common.hlsl ----------------------------------------------------------------
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        /*
        #define half min16float
        #define half2 min16float2
        #define half3 min16float3
        #define half4 min16float4
        #define half2x2 min16float2x2
        #define half2x3 min16float2x3
        #define half3x2 min16float3x2
        #define half3x3 min16float3x3
        #define half3x4 min16float3x4
        #define half4x3 min16float4x3
        #define half4x4 min16float4x4
        */
        #define real half
        #define real2 half2
        #define real3 half3
        #define real4 half4
        #define real2x2 half2x2
        #define real2x3 half2x3
        #define real2x4 half2x4
        #define real3x2 half3x2
        #define real3x3 half3x3
        #define real3x4 half3x4
        #define real4x3 half4x3
        #define real4x4 half4x4
        
        
        float3 SafeNormalize(float3 inVec)
        {
            float dp3 = max(FLT_MIN, dot(inVec, inVec));
            return inVec * rsqrt(dp3);
        }
        
        
        #if defined(UNITY_STEREO_INSTANCING_ENABLED) || defined(UNITY_STEREO_MULTIVIEW_ENABLED)
        
            #define SLICE_ARRAY_INDEX   unity_StereoEyeIndex
        
            #define TEXTURE2D_X(textureName)                                        TEXTURE2D_ARRAY(textureName)
            #define TEXTURE2D_X_PARAM(textureName, samplerName)                     TEXTURE2D_ARRAY_PARAM(textureName, samplerName)
            #define TEXTURE2D_X_ARGS(textureName, samplerName)                      TEXTURE2D_ARRAY_ARGS(textureName, samplerName)
            #define TEXTURE2D_X_HALF(textureName)                                   TEXTURE2D_ARRAY_HALF(textureName)
            #define TEXTURE2D_X_FLOAT(textureName)                                  TEXTURE2D_ARRAY_FLOAT(textureName)
        
            #define LOAD_TEXTURE2D_X(textureName, unCoord2)                         LOAD_TEXTURE2D_ARRAY(textureName, unCoord2, SLICE_ARRAY_INDEX)
            #define LOAD_TEXTURE2D_X_LOD(textureName, unCoord2, lod)                LOAD_TEXTURE2D_ARRAY_LOD(textureName, unCoord2, SLICE_ARRAY_INDEX, lod)
            #define SAMPLE_TEXTURE2D_X(textureName, samplerName, coord2)            SAMPLE_TEXTURE2D_ARRAY(textureName, samplerName, coord2, SLICE_ARRAY_INDEX)
            #define SAMPLE_TEXTURE2D_X_LOD(textureName, samplerName, coord2, lod)   SAMPLE_TEXTURE2D_ARRAY_LOD(textureName, samplerName, coord2, SLICE_ARRAY_INDEX, lod)
            #define GATHER_TEXTURE2D_X(textureName, samplerName, coord2)            GATHER_TEXTURE2D_ARRAY(textureName, samplerName, coord2, SLICE_ARRAY_INDEX)
            #define GATHER_RED_TEXTURE2D_X(textureName, samplerName, coord2)        GATHER_RED_TEXTURE2D(textureName, samplerName, float3(coord2, SLICE_ARRAY_INDEX))
            #define GATHER_GREEN_TEXTURE2D_X(textureName, samplerName, coord2)      GATHER_GREEN_TEXTURE2D(textureName, samplerName, float3(coord2, SLICE_ARRAY_INDEX))
            #define GATHER_BLUE_TEXTURE2D_X(textureName, samplerName, coord2)       GATHER_BLUE_TEXTURE2D(textureName, samplerName, float3(coord2, SLICE_ARRAY_INDEX))
        
        #else
            #define SLICE_ARRAY_INDEX       0
        
            #define TEXTURE2D_X(textureName)                                        TEXTURE2D(textureName)
            #define TEXTURE2D_X_PARAM(textureName, samplerName)                     TEXTURE2D_PARAM(textureName, samplerName)
            #define TEXTURE2D_X_ARGS(textureName, samplerName)                      TEXTURE2D_ARGS(textureName, samplerName)
            #define TEXTURE2D_X_HALF(textureName)                                   TEXTURE2D_HALF(textureName)
            #define TEXTURE2D_X_FLOAT(textureName)                                  TEXTURE2D_FLOAT(textureName)
        
            #define LOAD_TEXTURE2D_X(textureName, unCoord2)                         LOAD_TEXTURE2D(textureName, unCoord2)
            #define LOAD_TEXTURE2D_X_LOD(textureName, unCoord2, lod)                LOAD_TEXTURE2D_LOD(textureName, unCoord2, lod)
            #define SAMPLE_TEXTURE2D_X(textureName, samplerName, coord2)            SAMPLE_TEXTURE2D(textureName, samplerName, coord2)
            #define SAMPLE_TEXTURE2D_X_LOD(textureName, samplerName, coord2, lod)   SAMPLE_TEXTURE2D_LOD(textureName, samplerName, coord2, lod)
            #define GATHER_TEXTURE2D_X(textureName, samplerName, coord2)            GATHER_TEXTURE2D(textureName, samplerName, coord2)
            #define GATHER_RED_TEXTURE2D_X(textureName, samplerName, coord2)        GATHER_RED_TEXTURE2D(textureName, samplerName, coord2)
            #define GATHER_GREEN_TEXTURE2D_X(textureName, samplerName, coord2)      GATHER_GREEN_TEXTURE2D(textureName, samplerName, coord2)
            #define GATHER_BLUE_TEXTURE2D_X(textureName, samplerName, coord2)       GATHER_BLUE_TEXTURE2D(textureName, samplerName, coord2)
        #endif
        
        
        
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        // SpaceTransforms.hlsl ----------------------------------------------------------------
        //-----------------------------------------------------------------------------
        //-----------------------------------------------------------------------------
        
        
        float4x4 GetObjectToWorldMatrix()
        {
            return UNITY_MATRIX_M;
        }
        
        #define UNITY_MATRIX_I_M unity_WorldToObject
        float4x4 GetWorldToObjectMatrix()
        {
            return UNITY_MATRIX_I_M;
        }
        /* Does not exist in BiRP
        float4x4 GetPrevObjectToWorldMatrix()
        {
            return UNITY_PREV_MATRIX_M;
        }
        
        float4x4 GetPrevWorldToObjectMatrix()
        {
            return UNITY_PREV_MATRIX_I_M;
        }
        */
        
        float4x4 GetWorldToViewMatrix()
        {
            return UNITY_MATRIX_V;
        }
        
        float4x4 GetViewToWorldMatrix()
        {
            return UNITY_MATRIX_I_V;
        }
        
        // Transform to homogenous clip space
        float4x4 GetWorldToHClipMatrix()
        {
            return UNITY_MATRIX_VP;
        }
        
        // Transform to homogenous clip space
        float4x4 GetViewToHClipMatrix()
        {
            return UNITY_MATRIX_P;
        }
        
        // This function always return the absolute position in WS
        float3 GetAbsolutePositionWS(float3 positionRWS)
        {
        #if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
            positionRWS += _WorldSpaceCameraPos.xyz;
        #endif
            return positionRWS;
        }
        
        // This function return the camera relative position in WS
        float3 GetCameraRelativePositionWS(float3 positionWS)
        {
        #if (SHADEROPTIONS_CAMERA_RELATIVE_RENDERING != 0)
            positionWS -= _WorldSpaceCameraPos.xyz;
        #endif
            return positionWS;
        }
        
        half GetOddNegativeScale()
        {
            // FIXME: We should be able to just return unity_WorldTransformParams.w, but it is not
            // properly set at the moment, when doing ray-tracing; once this has been fixed in cpp,
            // we can revert back to the former implementation.
            return unity_WorldTransformParams.w >= 0.0 ? 1.0 : -1.0;
        }
        
        float3 TransformObjectToWorld(float3 positionOS)
        {
            #if defined(SHADER_STAGE_RAY_TRACING)
            return mul(ObjectToWorld3x4(), float4(positionOS, 1.0)).xyz;
            #else
            return mul(GetObjectToWorldMatrix(), float4(positionOS, 1.0)).xyz;
            #endif
        }
        
        float3 TransformWorldToObject(float3 positionWS)
        {
            #if defined(SHADER_STAGE_RAY_TRACING)
            return mul(WorldToObject3x4(), float4(positionWS, 1.0)).xyz;
            #else
            return mul(GetWorldToObjectMatrix(), float4(positionWS, 1.0)).xyz;
            #endif
        }
        
        float3 TransformWorldToView(float3 positionWS)
        {
            return mul(GetWorldToViewMatrix(), float4(positionWS, 1.0)).xyz;
        }
        
        float3 TransformViewToWorld(float3 positionVS)
        {
            return mul(GetViewToWorldMatrix(), float4(positionVS, 1.0)).xyz;
        }
        
        // Transforms position from object space to homogenous space
        float4 TransformObjectToHClip(float3 positionOS)
        {
            // More efficient than computing M*VP matrix product
            return mul(GetWorldToHClipMatrix(), mul(GetObjectToWorldMatrix(), float4(positionOS, 1.0)));
        }
        
        // Transforms position from world space to homogenous space
        float4 TransformWorldToHClip(float3 positionWS)
        {
            return mul(GetWorldToHClipMatrix(), float4(positionWS, 1.0));
        }
        
        // Transforms position from view space to homogenous space
        float4 TransformWViewToHClip(float3 positionVS)
        {
            return mul(GetViewToHClipMatrix(), float4(positionVS, 1.0));
        }
        
        // Normalize to support uniform scaling
        float3 TransformObjectToWorldDir(float3 dirOS, bool doNormalize = true)
        {
            #ifndef SHADER_STAGE_RAY_TRACING
            float3 dirWS = mul((float3x3)GetObjectToWorldMatrix(), dirOS);
            #else
            float3 dirWS = mul((float3x3)ObjectToWorld3x4(), dirOS);
            #endif
            if (doNormalize)
                return SafeNormalize(dirWS);
            return dirWS;
        }
        
        // Normalize to support uniform scaling
        float3 TransformWorldToObjectDir(float3 dirWS, bool doNormalize = true)
        {
            #ifndef SHADER_STAGE_RAY_TRACING
            float3 dirOS = mul((float3x3)GetWorldToObjectMatrix(), dirWS);
            #else
            float3 dirOS = mul((float3x3)WorldToObject3x4(), dirWS);
            #endif
            if (doNormalize)
                return normalize(dirOS);
        
            return dirOS;
        }
        
        // Transforms vector from world space to view space
        float3 TransformWorldToViewDir(float3 dirWS, bool doNormalize = false)
        {
            float3 dirVS = mul( (float3x3)UNITY_MATRIX_V, dirWS).xyz;
            if (doNormalize)
                return normalize(dirVS);
        
            return dirVS;
        }
        
        // Transforms vector from view space to world space
        float3 TransformViewToWorldDir(float3 dirVS, bool doNormalize = false)
        {
            float3 dirWS = mul((float3x3)GetViewToWorldMatrix(), dirVS).xyz;
            if (doNormalize)
                return normalize(dirWS);
        
            return dirWS;
        }
        
        // Transforms normal from world space to view space
        float3 TransformWorldToViewNormal(float3 normalWS, bool doNormalize = false)
        {
            // assuming view matrix is uniformly scaled, we can use direction transform
            return TransformWorldToViewDir(normalWS, doNormalize);
        }
        
        // Transforms normal from view space to world space
        float3 TransformViewToWorldNormal(float3 normalVS, bool doNormalize = false)
        {
            // assuming view matrix is uniformly scaled, we can use direction transform
            return TransformViewToWorldDir(normalVS, doNormalize);
        }
        
        // Transforms vector from world space to homogenous space
        float3 TransformWorldToHClipDir(float3 directionWS, bool doNormalize = false)
        {
            float3 dirHCS = mul((float3x3)GetWorldToHClipMatrix(), directionWS).xyz;
            if (doNormalize)
                return normalize(dirHCS);
        
            return dirHCS;
        }
        
        // Transforms normal from object to world space
        float3 TransformObjectToWorldNormal(float3 normalOS, bool doNormalize = true)
        {
        #ifdef UNITY_ASSUME_UNIFORM_SCALING
            return TransformObjectToWorldDir(normalOS, doNormalize);
        #else
            // Normal need to be multiply by inverse transpose
            float3 normalWS = mul(normalOS, (float3x3)GetWorldToObjectMatrix());
            if (doNormalize)
                return SafeNormalize(normalWS);
        
            return normalWS;
        #endif
        }
        
        // Transforms normal from world to object space
        float3 TransformWorldToObjectNormal(float3 normalWS, bool doNormalize = true)
        {
        #ifdef UNITY_ASSUME_UNIFORM_SCALING
            return TransformWorldToObjectDir(normalWS, doNormalize);
        #else
            // Normal need to be multiply by inverse transpose
            float3 normalOS = mul(normalWS, (float3x3)GetObjectToWorldMatrix());
            if (doNormalize)
                return SafeNormalize(normalOS);
        
            return normalOS;
        #endif
        }
        
        float3x3 CreateTangentToWorld(float3 normal, float3 tangent, float flipSign)
        {
            // For odd-negative scale transforms we need to flip the sign
            float sgn = flipSign * GetOddNegativeScale();
            float3 bitangent = cross(normal, tangent) * sgn;
        
            return float3x3(tangent, bitangent, normal);
        }
        
        // this function is intended to work on Normals (handles non-uniform scale)
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformTangentToWorld(float3 normalTS, float3x3 tangentToWorld, bool doNormalize = false)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
            float3 result = mul(normalTS, tangentToWorld);
            if (doNormalize)
                return SafeNormalize(result);
            return result;
        }
        
        // this function is intended to work on Normals (handles non-uniform scale)
        // This function does the exact inverse of TransformTangentToWorld() and is
        // also decribed within comments in mikktspace.h and it follows implicitly
        // from the scalar triple product (google it).
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformWorldToTangent(float3 normalWS, float3x3 tangentToWorld, bool doNormalize = true)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
            float3 row0 = tangentToWorld[0];
            float3 row1 = tangentToWorld[1];
            float3 row2 = tangentToWorld[2];
        
            // these are the columns of the inverse matrix but scaled by the determinant
            float3 col0 = cross(row1, row2);
            float3 col1 = cross(row2, row0);
            float3 col2 = cross(row0, row1);
        
            float determinant = dot(row0, col0);
        
            // inverse transposed but scaled by determinant
            // Will remove transpose part by using matrix as the first arg in the mul() below
            // this makes it the exact inverse of what TransformTangentToWorld() does.
            float3x3 matTBN_I_T = float3x3(col0, col1, col2);
            float3 result = mul(matTBN_I_T, normalWS);
            if (doNormalize)
            {
                float sgn = determinant < 0.0 ? (-1.0) : 1.0;
                return SafeNormalize(sgn * result);
            }
            else
                return result / determinant;
        }
        
        // this function is intended to work on Vectors/Directions
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformWorldToTangentDir(float3 dirWS, float3x3 tangentToWorld, bool doNormalize = false)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
            float3 result = mul(tangentToWorld, dirWS);
            if (doNormalize)
                return SafeNormalize(result);
            return result;
        }
        
        // this function is intended to work on Vectors/Directions
        // This function does the exact inverse of TransformWorldToTangentDir()
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformTangentToWorldDir(float3 dirWS, float3x3 tangentToWorld, bool doNormalize = false)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
            float3 row0 = tangentToWorld[0];
            float3 row1 = tangentToWorld[1];
            float3 row2 = tangentToWorld[2];
        
            // these are the columns of the inverse matrix but scaled by the determinant
            float3 col0 = cross(row1, row2);
            float3 col1 = cross(row2, row0);
            float3 col2 = cross(row0, row1);
        
            float determinant = dot(row0, col0);
        
            // inverse transposed but scaled by determinant
            // Will remove transpose part by using matrix as the second arg in the mul() below
            // this makes it the exact inverse of what TransformWorldToTangentDir() does.
            float3x3 matTBN_I_T = float3x3(col0, col1, col2);
            float3 result = mul(dirWS, matTBN_I_T);
            if (doNormalize)
            {
                float sgn = determinant < 0.0 ? (-1.0) : 1.0;
                return SafeNormalize(sgn * result);
            }
            else
                return result / determinant;
        }
        
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformTangentToObject(float3 dirTS, float3x3 tangentToWorld)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
            float3 normalWS = TransformTangentToWorld(dirTS, tangentToWorld);
            return TransformWorldToObjectNormal(normalWS);
        }
        
        // tangentToWorld is the matrix representing the transformation of a normal from tangent to world space
        float3 TransformObjectToTangent(float3 dirOS, float3x3 tangentToWorld)
        {
            // Note matrix is in row major convention with left multiplication as it is build on the fly
        
            // don't normalize, as normalWS will be normalized after TransformWorldToTangent
            float3 normalWS = TransformObjectToWorldNormal(dirOS, false);
        
            // transform from world to tangent
            return TransformWorldToTangent(normalWS, tangentToWorld);
        }
        
        // orels1 additions
        
        float3 GetObjectScale()
        {
            float4x4 objToWorld = GetObjectToWorldMatrix();
            return float3(
                length(objToWorld._m00_m10_m20),
                length(objToWorld._m01_m11_m21),
                length(objToWorld._m02_m12_m22)
            );
        }
        
        float4 GetScreenPosition(float4 positionCS)
        {
            float4 ndc = positionCS * 0.5f;
            ndc.xy = float2(ndc.x, ndc.y * _ProjectionParams.x) + ndc.w;
            ndc.zw = positionCS.zw;
        
            ndc.xy = TransformStereoScreenSpaceTex(ndc.xy, ndc.w);
            return ndc;
        }
        
        // Delcare things in-place so that the sampler/texture can be used in the function below
        TEXTURE2D_X_FLOAT(_CameraDepthTexture);
        SAMPLER(sampler_CameraDepthTexture);
        
        float SampleSceneDepth(float2 uv)
        {
            return SAMPLE_TEXTURE2D_X(_CameraDepthTexture, sampler_CameraDepthTexture, uv).r;
        }
        
        float2 SampleSceneDepthRGDecoded(float2 uv)
        {
            float2 depthRG = SAMPLE_TEXTURE2D_X(_CameraDepthTexture, sampler_CameraDepthTexture, uv).rg;
            return dot(depthRG, float2(1.0, 1/255.0));
        }
        
        // We need this so that we can replace `UNITY_LIGHT_ATTENUATION`
        struct Light
        {
            float3   direction;
            half3   color;
            half    shadowAttenuation;
        };
        
        Light GetMainLight()
        {
            Light light;
                
            light.direction = _WorldSpaceLightPos0.xyz;
            light.shadowAttenuation = 1.0;
            light.color = _LightColor0.rgb;
        
            return light;
        }
        
        struct __BridgeShadowStruct
        {
            float4 pos;
            float4 _ShadowCoord;
        };
        
        Light GetMainLight(float4 shadowCoord)
        {
            Light light = GetMainLight();
        
            __BridgeShadowStruct input = (__BridgeShadowStruct) 0;
            input._ShadowCoord = shadowCoord;
            UNITY_LIGHT_ATTENUATION(lightAttenuation, input, 0..xxx);
            light.shadowAttenuation = lightAttenuation;
            return light;
        }
        
        Light GetMainLight(float4 shadowCoord, float3 positionWS, half4 shadowMask)
        {
            Light light = GetMainLight();
        
            // In BIRP we consider all lights "main lights", so we utilize world space position to get final light direction
            #ifndef USING_DIRECTIONAL_LIGHT
            light.direction = normalize(UnityWorldSpaceLightDir(positionWS));
            #endif
                
            __BridgeShadowStruct input = (__BridgeShadowStruct) 0;
            input._ShadowCoord = shadowCoord;
            UNITY_LIGHT_ATTENUATION(lightAttenuation, input, positionWS);
                
            light.shadowAttenuation = lightAttenuation;
        
            return light;
        }
        
        float3 UnpackNormalScale(float4 packedNormal, float scale)
        {
            return UnpackScaleNormal(packedNormal, scale);
        }
        
        void LODFadeCrossFade(float2 positionCS)
        {
            #if defined(LOD_FADE_CROSSFADE)
            UnityApplyDitherCrossFade(positionCS.xy);
            #endif
        }
        #endif
        
        #define FLT_EPSILON     1.192092896e-07
        
        // Helpful Macros
        #define DEBUG_FC(x) FinalColor.rgb *= 0.0001; \
                         FinalColor.rgb += x; \
                         return
        
        half3 BlendOverlay(half3 target, half3 source)
        {
            return (target > 0.5) * (1 - (1 - 2 * (target - 0.5)) * (1 - source)) + (target <= 0.5) * (2 * target * source);
        }
        
        bool isVR()
        {
        #if UNITY_SINGLE_PASS_STEREO
            return true;
        #else
            return false;
        #endif
        }
        
        bool isStereoView() {
        #ifdef USING_STEREO_MATRICES
            return true;
        #else
            return UNITY_MATRIX_P._13 != 0;
        #endif
        }
        
        half3 BlendLighten(half3 target, half3 source) {
            return max(target, source);
        }
        
        half3 BlendScreen(half3 target, half3 source) {
            return 1 - (1 - target) * (1 - source);
        }
        
        half invLerp(half a, half b, half v)
        {
            return (v - a) / (b - a);
        }
        
        half3 invLerp(half3 a, half3 b, half3 v)
        {
            return (v - a) / (b - a);
        }
        
        
        // w0, w1, w2, and w3 are the four cubic B-spline basis functions
        half w0(half a)
        {
          //    return (1.0f/6.0f)*(-a*a*a + 3.0f*a*a - 3.0f*a + 1.0f);
            return (1.0f / 6.0f) * (a * (a * (-a + 3.0f) - 3.0f) + 1.0f);   // optimized
        
        }
        
        half w1(half a)
        {
          //    return (1.0f/6.0f)*(3.0f*a*a*a - 6.0f*a*a + 4.0f);
            return (1.0f / 6.0f) * (a * a * (3.0f * a - 6.0f) + 4.0f);
        }
        
        half w2(half a)
        {
          //    return (1.0f/6.0f)*(-3.0f*a*a*a + 3.0f*a*a + 3.0f*a + 1.0f);
            return (1.0f / 6.0f) * (a * (a * (-3.0f * a + 3.0f) + 3.0f) + 1.0f);
        }
        
        half w3(half a)
        {
            return (1.0f / 6.0f) * (a * a * a);
        }
        
        // g0 and g1 are the two amplitude functions
        half g0(half a)
        {
            return w0(a) + w1(a);
        }
        
        half g1(half a)
        {
            return w2(a) + w3(a);
        }
        
        // h0 and h1 are the two offset functions
        half h0(half a)
        {
          // note +0.5 offset to compensate for CUDA linear filtering convention
            return -1.0f + w1(a) / (w0(a) + w1(a)) + 0.5f;
        }
        
        half h1(half a)
        {
            return 1.0f + w3(a) / (w2(a) + w3(a)) + 0.5f;
        }
        
        half4 tex2DFastBicubicSample(Texture2D tex, SamplerState texSampler, float2 uv)
        {
            #if !defined(PLAT_QUEST) && defined(BICUBIC_LIGHTMAP)
            half width;
            half height;
            tex.GetDimensions(width, height);
            half x = uv.x * width;
            half y = uv.y * height;
        
        
        
            x -= 0.5f;
            y -= 0.5f;
            half px = floor(x);
            half py = floor(y);
            half fx = x - px;
            half fy = y - py;
        
            // note: we could store these functions in a lookup table texture, but maths is cheap
            half g0x = g0(fx);
            half g1x = g1(fx);
            half h0x = h0(fx);
            half h1x = h1(fx);
            half h0y = h0(fy);
            half h1y = h1(fy);
        
            half4 r = g0(fy) * (g0x * tex.Sample(texSampler, (half2(px + h0x, py + h0y) * 1.0f / width)) +
            g1x * tex.Sample(texSampler, (half2(px + h1x, py + h0y) * 1.0f / width))) +
            g1(fy) * (g0x * tex.Sample(texSampler, (half2(px + h0x, py + h1y) * 1.0f / width)) +
            g1x * tex.Sample(texSampler, (half2(px + h1x, py + h1y) * 1.0f / width)));
            return r;
            #else
            return tex.Sample(texSampler, uv);
            #endif
        }
        
        float4 tex2DFastBicubicSampleNoChecks(Texture2D tex, SamplerState texSampler, float2 uv)
        {
            half width;
            half height;
            tex.GetDimensions(width, height);
            half x = uv.x * width;
            half y = uv.y * height;
        
        
        
            x -= 0.5f;
            y -= 0.5f;
            half px = floor(x);
            half py = floor(y);
            half fx = x - px;
            half fy = y - py;
        
            // note: we could store these functions in a lookup table texture, but maths is cheap
            half g0x = g0(fx);
            half g1x = g1(fx);
            half h0x = h0(fx);
            half h1x = h1(fx);
            half h0y = h0(fy);
            half h1y = h1(fy);
        
            half4 r = g0(fy) * (g0x * tex.Sample(texSampler, (half2(px + h0x, py + h0y) * 1.0f / width)) +
            g1x * tex.Sample(texSampler, (half2(px + h1x, py + h0y) * 1.0f / width))) +
            g1(fy) * (g0x * tex.Sample(texSampler, (half2(px + h0x, py + h1y) * 1.0f / width)) +
            g1x * tex.Sample(texSampler, (half2(px + h1x, py + h1y) * 1.0f / width)));
            return r;
        }
        
        half4 tex2DFastBicubicSampleLevel(Texture2D tex, SamplerState texSampler, float2 uv, int level)
        {
            #if !defined(PLAT_QUEST) && defined(BICUBIC_LIGHTMAP)
            half width;
            half height;
            tex.GetDimensions(width, height);
            half x = uv.x * width;
            half y = uv.y * height;
        
        
        
            x -= 0.5f;
            y -= 0.5f;
            half px = floor(x);
            half py = floor(y);
            half fx = x - px;
            half fy = y - py;
        
            // note: we could store these functions in a lookup table texture, but maths is cheap
            half g0x = g0(fx);
            half g1x = g1(fx);
            half h0x = h0(fx);
            half h1x = h1(fx);
            half h0y = h0(fy);
            half h1y = h1(fy);
        
            half4 r = g0(fy) * (g0x * tex.SampleLevel(texSampler, (half2(px + h0x, py + h0y) * 1.0f / width), level) +
            g1x * tex.SampleLevel(texSampler, (half2(px + h1x, py + h0y) * 1.0f / width), level)) +
            g1(fy) * (g0x * tex.SampleLevel(texSampler, (half2(px + h0x, py + h1y) * 1.0f / width), level) +
            g1x * tex.SampleLevel(texSampler, (half2(px + h1x, py + h1y) * 1.0f / width), level));
            return r;
            #else
            return tex.SampleLevel(texSampler, uv, level);
            #endif
        }
        
        half getBakedNoise(Texture2D noiseTex, SamplerState noiseTexSampler, float3 p)
        {
            float3 i = floor(p); p -= i; p *= p * (3. - 2. * p);
            float2 uv = (p.xy + i.xy + float2(37, 17) * i.z + .5) / 256.;
            uv.y *= -1;
            p.xy = noiseTex.SampleLevel(noiseTexSampler, uv, 0).yx;
            return lerp(p.x, p.y, p.z);
        }
        
        // Manual bilinear sampling to avoid 8 bit precision issues
        // Based on https://www.shadertoy.com/view/MllSzX
        half getBakedNoiseBilinear(Texture2D noiseTex, SamplerState noiseTexSampler, float4 texSize, float3 p)
        {
            float3 i = floor(p); p -= i; p *= p * (3. - 2. * p);
            float2 uv = (p.xy + i.xy + float2(37, 17) * i.z + .5) / 256.;
            uv.y *= -1;
                
            float2 pixelUv = uv * texSize.zw + 0.5;
            float2 pixelUvFrac = frac(pixelUv);
        
            pixelUv = (floor(pixelUv) / texSize.zw) - texSize.xy * 0.5;
        
            float4 sample0 = noiseTex.SampleLevel(noiseTexSampler, pixelUv, 0);
            float4 sample1 = noiseTex.SampleLevel(noiseTexSampler, pixelUv + float2(texSize.x, 0), 0);
            float4 sample2 = noiseTex.SampleLevel(noiseTexSampler, pixelUv + float2(0, texSize.y), 0);
            float4 sample3 = noiseTex.SampleLevel(noiseTexSampler, pixelUv + float2(texSize.x, texSize.y), 0);
        
            float4 filtered1 = lerp(sample0, sample1, pixelUvFrac.x);
            float4 filtered2 = lerp(sample2, sample3, pixelUvFrac.x);
            float4 filtered = lerp(filtered1, filtered2, pixelUvFrac.y);
                
            p.xy = filtered.yx;
            return lerp(p.x, p.y, p.z);
        }
        
        half getBakedNoiseBicubic(Texture2D noiseTex, SamplerState noiseTexSampler, float3 p)
        {
            float3 i = floor(p); p -= i; p *= p * (3. - 2. * p);
            float2 uv = (p.xy + i.xy + float2(37, 17) * i.z + .5) / 256.;
            uv.y *= -1;
            p.xy = tex2DFastBicubicSampleLevel(noiseTex, noiseTexSampler, uv, 0).yx;
            return lerp(p.x, p.y, p.z);
        }
        
        half remap(half s, half a1, half a2, half b1, half b2)
        {
            return b1 + (s - a1) * (b2 - b1) / (a2 - a1);
        }
        
        half3 ApplyLut2D(Texture2D LUT2D, SamplerState lutSampler, half3 uvw)
        {
            half3 scaleOffset = half3(1.0 / 1024.0, 1.0 / 32.0, 31.0);
            // Strip format where `height = sqrt(width)`
            uvw.z *= scaleOffset.z;
            half shift = floor(uvw.z);
            uvw.xy = uvw.xy * scaleOffset.z * scaleOffset.xy + scaleOffset.xy * 0.5;
            uvw.x += shift * scaleOffset.y;
            uvw.xyz = lerp(
                LUT2D.Sample(lutSampler, uvw.xy).rgb,
                LUT2D.Sample(lutSampler, uvw.xy + half2(scaleOffset.y, 0.0)).rgb,
                uvw.z - shift
            );
            return uvw;
        }
        
        half3 HSV2RGB(half3 hsv)
        {    
            return hsv.z + hsv.z * hsv.y * (clamp(abs(fmod(hsv.x * 6.0 + half3(0,4,2), 6.0) - 3.0) - 1.0,0.0,1.0) - 1.0);
        }
        
        half3 RGB2HSV(half3 rgb)
        {
            half4 K = half4(0.0, -1.0 / 3.0, 2.0 / 3.0, -1.0);
            half4 p = lerp(half4(rgb.bg, K.wz), half4(rgb.gb, K.xy), step(rgb.b, rgb.g));
            half4 q = lerp(half4(p.xyw, rgb.r), half4(rgb.r, p.yzx), step(p.x, rgb.r));
        
            half d = q.x - min(q.w, q.y);
            half e = 1.0e-10;
            return half3(abs(q.z + (q.w - q.y) / (6.0 * d + e)), d / (q.x + e), q.x);
        }
        
        half3 AdjustContrast(half3 color, half contrast)
        {
            color = saturate(lerp(half3(0.5, 0.5, 0.5), color, contrast));
            return color;
        }
        
        half3 AdjustSaturation(half3 color, half saturation)
        {
            half3 intensity = dot(color.rgb, half3(0.299, 0.587, 0.114));
            color = lerp(intensity, color.rgb, saturation);
            return color;
        }
        
        half3 AdjustBrightness(half3 color, half brightness)
        {
            color += brightness;
            return color;
        }
        
        struct ParamsLogC
        {
            half cut;
            half a, b, c, d, e, f;
        };
        
        static const ParamsLogC LogC = {
            0.011361, // cut
            5.555556, // a
            0.047996, // b
            0.244161, // c
            0.386036, // d
            5.301883, // e
            0.092819  // f
        
        };
        
        half LinearToLogC_Precise(half x)
        {
            half o;
            if (x > LogC.cut)
                o = LogC.c * log10(LogC.a * x + LogC.b) + LogC.d;
            else
                o = LogC.e * x + LogC.f;
            return o;
        }
        
        half PositivePow(half base, half power)
        {
            return pow(max(abs(base), half(FLT_EPSILON)), power);
        }
        
        half3 LinearToLogC(half3 x)
        {
            return LogC.c * log10(LogC.a * x + LogC.b) + LogC.d;
        }
        
        half3 LinerToSRGB(half3 c)
        {
            return c * (c * (c * 0.305306011 + 0.682171111) + 0.012522878);
        }
        
        half3 SRGBToLinear(half3 c)
        {
            return max(1.055 * PositivePow(c, 0.416666667) - 0.055, 0.0);
        }
        
        half3 LogCToLinear(half3 c)
        {
            return (pow(10.0, (c - LogC.d) / LogC.c) - LogC.b) / LogC.a;
        }
        
        // Specular stuff taken from https://github.com/z3y/shaders/
        float pow5(float x)
        {
            float x2 = x * x;
            return x2 * x2 * x;
        }
        
        float sq(float x)
        {
            return x * x;
        }
        
        struct Gradient
        {
            int type;
            int colorsLength;
            int alphasLength;
            half4 colors[8];
            half2 alphas[8];
        };
        
        Gradient NewGradient(
            int type, int colorsLength, int alphasLength,
            half4 colors0, half4 colors1, half4 colors2, half4 colors3, half4 colors4, half4 colors5, half4 colors6, half4 colors7,
            half2 alphas0, half2 alphas1, half2 alphas2, half2 alphas3, half2 alphas4, half2 alphas5, half2 alphas6, half2 alphas7)
        {
            Gradient g;
            g.type = type;
            g.colorsLength = colorsLength;
            g.alphasLength = alphasLength;
            g.colors[ 0 ] = colors0;
            g.colors[ 1 ] = colors1;
            g.colors[ 2 ] = colors2;
            g.colors[ 3 ] = colors3;
            g.colors[ 4 ] = colors4;
            g.colors[ 5 ] = colors5;
            g.colors[ 6 ] = colors6;
            g.colors[ 7 ] = colors7;
            g.alphas[ 0 ] = alphas0;
            g.alphas[ 1 ] = alphas1;
            g.alphas[ 2 ] = alphas2;
            g.alphas[ 3 ] = alphas3;
            g.alphas[ 4 ] = alphas4;
            g.alphas[ 5 ] = alphas5;
            g.alphas[ 6 ] = alphas6;
            g.alphas[ 7 ] = alphas7;
            return g;
        }
        
        half4 SampleGradient(Gradient gradient, half time)
        {
            half3 color = gradient.colors[0].rgb;
        
            UNITY_UNROLL
            for (int c = 1; c < 8; c++)
            {
                half colorPos = saturate((time - gradient.colors[c - 1].w) / (0.00001 + (gradient.colors[c].w - gradient.colors[c - 1].w)) * step(c, (half)gradient.colorsLength - 1));
                color = lerp(color, gradient.colors[c].rgb, lerp(colorPos, step(0.01, colorPos), gradient.type));
            }
        
            #ifndef UNITY_COLORSPACE_GAMMA
            color = half3(GammaToLinearSpaceExact(color.r), GammaToLinearSpaceExact(color.g), GammaToLinearSpaceExact(color.b));
            #endif
        
            half alpha = gradient.alphas[0].x;
        
            UNITY_UNROLL
            for (int a = 1; a < 8; a++)
            {
                half alphaPos = saturate((time - gradient.alphas[a - 1].y) / (0.00001 + (gradient.alphas[a].y - gradient.alphas[a - 1].y)) * step(a, (half)gradient.alphasLength - 1));
                alpha = lerp(alpha, gradient.alphas[a].x, lerp(alphaPos, step(0.01, alphaPos), gradient.type));
            }
            return half4(color, alpha);
        }
        
        float3 RotateAroundAxis(float3 center, float3 original, float3 u, float angle)
        {
            original -= center;
            float C = cos(angle);
            float S = sin(angle);
            float t = 1 - C;
            float m00 = t * u.x * u.x + C;
            float m01 = t * u.x * u.y - S * u.z;
            float m02 = t * u.x * u.z + S * u.y;
            float m10 = t * u.x * u.y + S * u.z;
            float m11 = t * u.y * u.y + C;
            float m12 = t * u.y * u.z - S * u.x;
            float m20 = t * u.x * u.z - S * u.y;
            float m21 = t * u.y * u.z + S * u.x;
            float m22 = t * u.z * u.z + C;
            float3x3 finalMatrix = float3x3(m00, m01, m02, m10, m11, m12, m20, m21, m22);
            return mul(finalMatrix, original) + center;
        }
        
        void GetTriplanarUV(half3 position, out half2 uvX, out half2 uvY, out half2 uvZ)
        {
            uvX = half2(position.z, position.y + 0.5);
            uvY = position.xz;
            uvZ = half2(position.x + 0.5, position.y + 0.5);
        }
        
        void GetTriplanarWeights(half3 normal, out half weightX, out half weightY, out half weightZ)
        {
            half3 absNormal = abs(normal);
            half3 sum = absNormal / (absNormal.x + absNormal.y + absNormal.z);
            weightX = sum.x;
            weightY = sum.y;
            weightZ = sum.z;
        }
        
        half2 Rotate2D(half2 source, half angle)
        {
            half2x2 rotMat = { cos(angle), -sin(angle), sin(angle), cos(angle) };
            return mul(rotMat, source);
        }
        
        float2 Rotate2DFloat(float2 source, float angle)
        {
            float2x2 rotMat = { cos(angle), -sin(angle), sin(angle), cos(angle) };
            return mul(rotMat, source);
        }
        
        struct ORL_UVChannelData
        {
            float4 uv0;
            float4 uv1;
            float4 uv2;
            float4 uv3;
        };
        
        #define SetupChannelData(d) (ORL_UVChannelData)0; \
                                    uvData.uv0 = d.uv0; \
                                    uvData.uv1 = d.uv1; \
                                    uvData.uv2 = d.uv2; \
                                    uvData.uv3 = d.uv3
        
        float2 GetUVChannel(ORL_UVChannelData d, int channel, float4 ST)
        {
            float2 UV = 0;
            switch (channel) {
                case 0: UV = d.uv0; break;
                case 1: UV = d.uv1; break;
                case 2: UV = d.uv2; break;
                case 3: UV = d.uv3; break;
            }
            UV = UV * ST.xy + ST.zw;
            return UV;
        }
        
        float2 RotateAroundCenter2D(float2 source, float angle)
        {
            angle = radians(angle);
            float sinAngle = sin(angle);
            float cosAngle = cos(angle);
            float2x2 rotationMatrix = { cosAngle, -sinAngle, sinAngle, cosAngle };
            source -= 0.5;
            source = mul(rotationMatrix, source);
            source += 0.5;
            return source;
        }
        
            
        float GLSLMod(float x, float y)
        {
            return (((x)-(y)*floor((x)/(y))));
        }
        
        float2 GLSLMod(float2 x, float2 y)
        {
            return (((x)-(y)*floor((x)/(y))));
        }
        
        // Found in this article on tonemapping: https://mini.gmshaders.com/p/tonemaps
        // Narkowicz 2015, "ACES Filmic Tone Mapping Curve"
        float3 Tonemap_ACES(float3 x)
        {
            float a = 2.51;
            float b = 0.03;
            float c = 2.43;
            float d = 0.59;
            float e = 0.14;
            return (x * (a * x + b)) / (x * (c * x + d) + e);
        }
        
        // Hable 2010, "Filmic Tonemapping Operators"
        float3 Tonemap_Uncharted2(float3 x)
        {
            x *= 16.0;
            float A = 0.15;
            float B = 0.50;
            float C = 0.10;
            float D = 0.20;
            float E = 0.02;
            float F = 0.30;
                
            return ((x*(A*x+C*B)+D*E)/(x*(A*x+B)+D*F))-E/F;
        }
        
        float3 Tonemap_Unreal(float3 x)
        {
            // Unreal 3, Documentation: "Color Grading"
            // Adapted to be close to Tonemap_ACES, with similar range
            // Gamma 2.2 correction is baked in, don't use with sRGB conversion!
            return x / (x + 0.155) * 1.019;
        }
        
        // https://github.com/yuki-koyama/enhancer
        // MIT License
        
        // Copyright (c) 2018 Yuki Koyama
        
        // Permission is hereby granted, free of charge, to any person obtaining a copy
        // of this software and associated documentation files (the "Software"), to deal
        // in the Software without restriction, including without limitation the rights
        // to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        // copies of the Software, and to permit persons to whom the Software is
        // furnished to do so, subject to the following conditions:
        
        // The above copyright notice and this permission notice shall be included in all
        // copies or substantial portions of the Software.
        
        // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        // IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        // FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        // AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        // LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        // SOFTWARE.
        float3 applyLiftGammaGainEffect(float3 linear_rgb, float3 lift, float3 gamma, float3 gain)
        {
            float3 lift_applied_linear_rgb  = clamp((linear_rgb - 1.0) * (2.0 - lift) + 1.0, 0.0, 1.0);
            float3 gain_applied_linear_rgb  = lift_applied_linear_rgb * gain;
            float3 gamma_applied_linear_rgb = pow(gain_applied_linear_rgb, 1.0 / gamma);
        
            return gamma_applied_linear_rgb;
        }
        
            
        // https://github.com/MochiesCode/Mochies-Unity-Shaders/
        // MIT License
        
        // Copyright (c) 2020 MochiesCode
        
        // Permission is hereby granted, free of charge, to any person obtaining a copy
        // of this software and associated documentation files (the "Software"), to deal
        // in the Software without restriction, including without limitation the rights
        // to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
        // copies of the Software, and to permit persons to whom the Software is
        // furnished to do so, subject to the following conditions:
        
        // The above copyright notice and this permission notice shall be included in all
        // copies or substantial portions of the Software.
        
        // THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
        // IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
        // FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
        // AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
        // LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
        // OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
        // SOFTWARE.
        float3 GetSpritesheetUV(float2 uv, float2 rowsColumns, float fps, int pauseFrames, int frameOffset){
            float2 size = float2(1/rowsColumns.x, 1/rowsColumns.y);
            uint totalFrames = rowsColumns.x * rowsColumns.y;
            uint index = 0;
            index = (_Time.y * fps + frameOffset) % (totalFrames + pauseFrames);
        
            if (index > totalFrames) {
                index = totalFrames;
            }
        
            uint indexX = index % rowsColumns.x;
            uint indexY = floor((index % totalFrames) / rowsColumns.x);
            float2 offset = float2(size.x*indexX,-size.y*indexY);
            float2 uv1 = uv*size;
            uv1.y = uv1.y + size.y*(rowsColumns.y - 1);
            uv = uv1 + offset;
            return float3(uv,0);
        }
        
        // SDFS
        // https://iquilezles.org/articles/distfunctions2d/
        float SDFBox(float2 p, float2 b )
        {
            float2 d = abs(p)-b;
            return length(max(d,0.0)) + min(max(d.x,d.y),0.0);
        }
        
        float SDFCircle(float2 p, float r)
        {
            return length(p) - r;
        }
        
        #ifndef AUDIOLINK_CGINC_INCLUDED
            #define AUDIOLINK_CGINC_INCLUDED
        
            // Map of where features in AudioLink are.
            #define ALPASS_DFT                      uint2(0,4)  //Size: 128, 2
            #define ALPASS_WAVEFORM                 uint2(0,6)  //Size: 128, 16
            #define ALPASS_AUDIOLINK                uint2(0,0)  //Size: 128, 4
            #define ALPASS_AUDIOBASS                uint2(0,0)  //Size: 128, 1
            #define ALPASS_AUDIOLOWMIDS             uint2(0,1)  //Size: 128, 1
            #define ALPASS_AUDIOHIGHMIDS            uint2(0,2)  //Size: 128, 1
            #define ALPASS_AUDIOTREBLE              uint2(0,3)  //Size: 128, 1
            #define ALPASS_AUDIOLINKHISTORY         uint2(1,0)  //Size: 127, 4
            #define ALPASS_GENERALVU                uint2(0,22) //Size: 12, 1
            #define ALPASS_GENERALVU_INSTANCE_TIME  uint2(2,22)
            #define ALPASS_GENERALVU_LOCAL_TIME     uint2(3,22)
            #define ALPASS_GENERALVU_NETWORK_TIME   uint2(4,22)
            #define ALPASS_GENERALVU_PLAYERINFO     uint2(6,22)
            #define ALPASS_THEME_COLOR0             uint2(0,23)
            #define ALPASS_THEME_COLOR1             uint2(1,23)
            #define ALPASS_THEME_COLOR2             uint2(2,23)
            #define ALPASS_THEME_COLOR3             uint2(3,23)
            #define ALPASS_GENERALVU_UNIX_DAYS      uint2(5,23)
            #define ALPASS_GENERALVU_UNIX_SECONDS   uint2(6,23)
            #define ALPASS_GENERALVU_SOURCE_POS     uint2(7,23)
            #define ALPASS_MEDIASTATE               uint2(5,22)
        
            #define ALPASS_CCINTERNAL               uint2(12,22) //Size: 12, 2
            #define ALPASS_CCCOLORS                 uint2(25,22) //Size: 12, 1 (Note Color #0 is always black, Colors start at 1)
            #define ALPASS_CCSTRIP                  uint2(0,24)  //Size: 128, 1
            #define ALPASS_CCLIGHTS                 uint2(0,25)  //Size: 128, 2
            #define ALPASS_AUTOCORRELATOR           uint2(0,27)  //Size: 128, 1
            #define ALPASS_FILTEREDAUDIOLINK        uint2(0,28)  //Size: 16, 4
            #define ALPASS_CHRONOTENSITY            uint2(16,28) //Size: 8, 4
            #define ALPASS_FILTEREDVU               uint2(24,28) //Size: 4, 4
            #define ALPASS_FILTEREDVU_INTENSITY     uint2(24,28) //Size: 4, 1
            #define ALPASS_FILTEREDVU_MARKER        uint2(24,29) //Size: 4, 1
            #define ALPASS_GLOBAL_STRINGS           uint2(40,28) //Size: 8, 4
        
            // Some basic constants to use (Note, these should be compatible with
            // future version of AudioLink, but may change.
            #define AUDIOLINK_SAMPHIST              3069        // Internal use for algos, do not change.
            #define AUDIOLINK_SAMPLEDATA24          2046
            #define AUDIOLINK_EXPBINS               24
            #define AUDIOLINK_EXPOCT                10
            #define AUDIOLINK_ETOTALBINS            (AUDIOLINK_EXPBINS * AUDIOLINK_EXPOCT)
            #define AUDIOLINK_WIDTH                 128
            #define AUDIOLINK_SPS                   48000       // Samples per second
            #define AUDIOLINK_ROOTNOTE              0
            #define AUDIOLINK_4BAND_FREQFLOOR       0.123
            #define AUDIOLINK_4BAND_FREQCEILING     1
            #define AUDIOLINK_BOTTOM_FREQUENCY      13.75
            #define AUDIOLINK_BASE_AMPLITUDE        2.5
            #define AUDIOLINK_DELAY_COEFFICIENT_MIN 0.3
            #define AUDIOLINK_DELAY_COEFFICIENT_MAX 0.9
            #define AUDIOLINK_DFT_Q                 4.0
            #define AUDIOLINK_TREBLE_CORRECTION     5.0
            #define AUDIOLINK_4BAND_TARGET_RATE     90.0
        
            // Text constants
            #define AUDIOLINK_STRING_MAX_CHARS      32
            #define AUDIOLINK_STRING_LOCALPLAYER    0
            #define AUDIOLINK_STRING_MASTER         1
            #define AUDIOLINK_STRING_CUSTOM1        2
            #define AUDIOLINK_STRING_CUSTOM2        3
        
            // ColorChord constants
            #define COLORCHORD_EMAXBIN              192
            #define COLORCHORD_NOTE_CLOSEST         3.0
            #define COLORCHORD_NEW_NOTE_GAIN        8.0
            #define COLORCHORD_MAX_NOTES            10
        
            // We use glsl_mod for most calculations because it behaves better
            // on negative numbers, and in some situations actually outperforms
            // HLSL's modf().
            #ifndef glsl_mod
                #define glsl_mod(x,y) (((x)-(y)*floor((x)/(y))))
            #endif
        
            uniform float4               _AudioTexture_TexelSize;
        
            #ifdef SHADER_TARGET_SURFACE_ANALYSIS
                #define AUDIOLINK_STANDARD_INDEXING
            #endif
        
            // Mechanism to index into texture.
            #ifdef AUDIOLINK_STANDARD_INDEXING
                sampler2D _AudioTexture;
                #define AudioLinkData(xycoord) tex2Dlod(_AudioTexture, float4(uint2(xycoord) * _AudioTexture_TexelSize.xy, 0, 0))
            #else
                uniform Texture2D<float4>   _AudioTexture;
                #define AudioLinkData(xycoord) _AudioTexture[uint2(xycoord)]
            #endif
        
            // Convenient mechanism to read from the AudioLink texture that handles reading off the end of one line and onto the next above it.
            float4 AudioLinkDataMultiline(uint2 xycoord) { return AudioLinkData(uint2(xycoord.x % AUDIOLINK_WIDTH, xycoord.y + xycoord.x/AUDIOLINK_WIDTH)); }
        
            // Mechanism to sample between two adjacent pixels and lerp between them, like "linear" supesampling
            float4 AudioLinkLerp(float2 xy) { return lerp( AudioLinkData(xy), AudioLinkData(xy+int2(1,0)), frac( xy.x ) ); }
        
            // Same as AudioLinkLerp but properly handles multiline reading.
            float4 AudioLinkLerpMultiline(float2 xy) { return lerp(AudioLinkDataMultiline(xy), AudioLinkDataMultiline(xy+float2(1,0)), frac(xy.x)); }
        
            //Tests to see if Audio Link texture is available
            bool AudioLinkIsAvailable()
            {
                #if !defined(AUDIOLINK_STANDARD_INDEXING)
                    int width, height;
                    _AudioTexture.GetDimensions(width, height);
                    return width > 16;
                #else
                    return _AudioTexture_TexelSize.z > 16;
                #endif
            }
        
            // DEPRECATED! Use AudioLinkGetVersionMajor and AudioLinkGetVersionMinor() instead.
            //Get version of audiolink present in the world, 0 if no audiolink is present
            float AudioLinkGetVersion()
            {
                int2 dims;
                #if !defined(AUDIOLINK_STANDARD_INDEXING)
                    _AudioTexture.GetDimensions(dims.x, dims.y);
                #else
                    dims = _AudioTexture_TexelSize.zw;
                #endif
        
                if (dims.x >= 128)
                    return AudioLinkData(ALPASS_GENERALVU).x;
                else if (dims.x > 16)
                    return 1;
                else
                    return 0;
            }
        
            float AudioLinkGetVersionMajor()
            {
                return AudioLinkData(ALPASS_GENERALVU).y;
            }
        
            float AudioLinkGetVersionMinor()
            {
                // If the major version is 1 or greater, we are using the new versioning system.
                if (AudioLinkGetVersionMajor() > 0)
                {
                    return AudioLinkData(ALPASS_GENERALVU).w;
                }
                // Otherwise, defer to the old logic for determining version.
                else
                {
                    int2 dims;
                    #if !defined(AUDIOLINK_STANDARD_INDEXING)
                        _AudioTexture.GetDimensions(dims.x, dims.y);
                    #else
                        dims = _AudioTexture_TexelSize.zw;
                    #endif
        
                    if (dims.x >= 128)
                        return AudioLinkData(ALPASS_GENERALVU).x;
                    else if (dims.x > 16)
                        return 1;
                    else
                        return 0;
                }
            }
        
            // This pulls data from this texture.
            #define AudioLinkGetSelfPixelData(xy) _SelfTexture2D[xy]
        
            // Extra utility functions for time.
            uint AudioLinkDecodeDataAsUInt(uint2 indexloc)
            {
                uint4 rpx = AudioLinkData(indexloc);
                return rpx.x + rpx.y*1024 + rpx.z * 1048576 + rpx.w * 1073741824;
            }
        
            //Note: This will truncate time to every 134,217.728 seconds (~1.5 days of an instance being up) to prevent floating point aliasing.
            // if your code will alias sooner, you will need to use a different function.  It should be safe to use this on all times.
            float AudioLinkDecodeDataAsSeconds(uint2 indexloc)
            {
                uint time = AudioLinkDecodeDataAsUInt(indexloc) & 0x7ffffff;
                //Can't just divide by float.  Bug in Unity's HLSL compiler.
                return float(time / 1000) + float( time % 1000 ) / 1000.; 
            }
        
            #define ALDecodeDataAsSeconds( x ) AudioLinkDecodeDataAsSeconds( x )
            #define ALDecodeDataAsUInt( x ) AudioLinkDecodeDataAsUInt( x )
        
            float AudioLinkRemap(float t, float a, float b, float u, float v) { return ((t-a) / (b-a)) * (v-u) + u; }
        
            float3 AudioLinkHSVtoRGB(float3 HSV)
            {
                float3 RGB = 0;
                float C = HSV.z * HSV.y;
                float H = HSV.x * 6;
                float X = C * (1 - abs(fmod(H, 2) - 1));
                if (HSV.y != 0)
                {
                    float I = floor(H);
                    if (I == 0) { RGB = float3(C, X, 0); }
                    else if (I == 1) { RGB = float3(X, C, 0); }
                    else if (I == 2) { RGB = float3(0, C, X); }
                    else if (I == 3) { RGB = float3(0, X, C); }
                    else if (I == 4) { RGB = float3(X, 0, C); }
                    else { RGB = float3(C, 0, X); }
                }
                float M = HSV.z - C;
                return RGB + M;
            }
        
            float3 AudioLinkCCtoRGB(float bin, float intensity, int rootNote)
            {
                float note = bin / AUDIOLINK_EXPBINS;
        
                float hue = 0.0;
                note *= 12.0;
                note = glsl_mod(4. - note + rootNote, 12.0);
                {
                    if(note < 4.0)
                    {
                        //Needs to be YELLOW->RED
                        hue = (note) / 24.0;
                    }
                    else if(note < 8.0)
                    {
                        //            [4]  [8]
                        //Needs to be RED->BLUE
                        hue = (note-2.0) / 12.0;
                    }
                    else
                    {
                        //             [8] [12]
                        //Needs to be BLUE->YELLOW
                        hue = (note - 4.0) / 8.0;
                    }
                }
                float val = intensity - 0.1;
                return AudioLinkHSVtoRGB(float3(fmod(hue, 1.0), 1.0, clamp(val, 0.0, 1.0)));
            }
        
            // Sample the amplitude of a given frequency in the DFT, supports frequencies in [13.75; 14080].
            float4 AudioLinkGetAmplitudeAtFrequency(float hertz)
            {
                float note = AUDIOLINK_EXPBINS * log2(hertz / AUDIOLINK_BOTTOM_FREQUENCY);
                return AudioLinkLerpMultiline(ALPASS_DFT + float2(note, 0));
            }
        
            // Sample the amplitude of a given quartertone in an octave. Octave is in [0; 9] while quarter is [0; 23].
            float4 AudioLinkGetAmplitudeAtQuarterNote(float octave, float quarter)
            {
                return AudioLinkLerpMultiline(ALPASS_DFT + float2(octave * AUDIOLINK_EXPBINS + quarter, 0));
            }
        
            // Sample the amplitude of a given semitone in an octave. Octave is in [0; 9] while note is [0; 11].
            float4 AudioLinkGetAmplitudeAtNote(float octave, float note)
            {
                float quarter = note * 2.0;
                return AudioLinkGetAmplitudeAtQuarterNote(octave, quarter);
            }
        
            // Sample the amplitude of a given quartertone across all octaves. Quarter is [0; 23].
            float4 AudioLinkGetAmplitudesAtQuarterNote(float quarter)
            {
                float amplitude = 0;
                UNITY_UNROLL
                for (int i = 0; i < AUDIOLINK_EXPOCT; i++)
                {
                    amplitude += AudioLinkGetAmplitudeAtQuarterNote(i,quarter);
                }
                return amplitude;
            }
        
            // Sample the amplitude of a given semitone across all octaves. Note is [0; 11].
            float4 AudioLinkGetAmplitudesAtNote(float note)
            {
                float quarter = note * 2.0;
                return AudioLinkGetAmplitudesAtQuarterNote(quarter);
            }
        
            // Get a reasonable drop-in replacement time value for _Time.y with the
            // given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTime(uint index, uint band)
            {
                return (AudioLinkDecodeDataAsUInt(ALPASS_CHRONOTENSITY + uint2(index, band))) / 100000.0;
            }
        
            // Get a chronotensity value in the interval [0; 1], modulated by the speed input, 
            // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTimeNormalized(uint index, uint band, float speed)
            {
                return frac(AudioLinkGetChronoTime(index, band) * speed);
            }
        
            // Get a chronotensity value in the interval [0; interval], modulated by the speed input, 
            // with the given chronotensity index [0; 7] and AudioLink band [0; 3].
            float AudioLinkGetChronoTimeInterval(uint index, uint band, float speed, float interval)
            {
                return AudioLinkGetChronoTimeNormalized(index, band, speed) * interval;
            }
        
            // Get time of day. The return value is a float4 with the values float3(hour, minute, second).
            float3 AudioLinkGetTimeOfDay()
            {
                float value = AudioLinkDecodeDataAsSeconds(ALPASS_GENERALVU_UNIX_SECONDS);
                float hour = floor(value / 3600.0);
                float minute = floor(value / 60.0) % 60.0;
                float second = value % 60.0;
                return float3(hour, minute, second);
            }
        
            // Get a character from a globally synced string, given an index of string in range [0; 3], and
            // a character index in range [0; 31]. The string at the 0th index is the local player name.
            // The 1st index is the master name, and index 2 and 3 are custom strings.
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetGlobalStringChar(uint stringIndex, uint charIndex)
            {
                uint4 fourChars = asuint(AudioLinkData(ALPASS_GLOBAL_STRINGS + uint2(charIndex / 4, stringIndex)));
                return fourChars[charIndex % 4];
            }
        
            // Get a character from the local player name given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetLocalPlayerNameChar(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_LOCALPLAYER, charIndex);
            }
        
            // Get a character from the master player name given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetMasterNameChar(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_MASTER, charIndex);
            }
        
            // Get a character from the first custom string given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetCustomString1Char(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_CUSTOM1, charIndex);
            }
        
            // Get a character from the second custom string given a character index in the range [0; 31].
            // Returns a unsigned integer represented a unicode codepoint, i.e. UTF32.
            uint AudioLinkGetCustomString2Char(uint charIndex)
            {
                return AudioLinkGetGlobalStringChar(AUDIOLINK_STRING_CUSTOM2, charIndex);
            }
        
            // Returns the position of the AudioLink AudioSource in world space.
            float4 AudioLinkGetAudioSourcePosition()
            {
                return float4(AudioLinkData(ALPASS_GENERALVU_SOURCE_POS).xyz,1);
            }
        #endif
        
        // Parts of the source taken from
        // [Xiexe-Unity-Shaders](https://github.com/Xiexe/Xiexes-Unity-Shaders) (c) Xiexe (MIT)
        // [z3y shaders](https://github.com/z3y/shaders) (c) z3y (MIT)
        
        // Default shading mode
        float D_GGX(float NoH, float roughness)
        {
            float a = NoH * roughness;
            float k = roughness / (1.0 - NoH * NoH + a * a);
            return k * k * (1.0 / UNITY_PI);
        }
        
        half D_GGX_Anisotropic(half NoH, const half3 h, const half3 t, const half3 b, half at, half ab)
        {
            half ToH = dot(t, h);
            half BoH = dot(b, h);
            half a2 = at * ab;
            half3 v = half3(ab * ToH, at * BoH, a2 * NoH);
            half v2 = dot(v, v);
            half w2 = a2 / v2;
            return a2 * w2 * w2 * (1.0 / UNITY_PI);
        }
        
        half V_SmithGGXCorrelated(half NoV, half NoL, half roughness)
        {
            half a2 = roughness * roughness;        
            half GGXV = NoL * sqrt(NoV * NoV * (1.0 - a2) + a2);
            half GGXL = NoV * sqrt(NoL * NoL * (1.0 - a2) + a2);
            return 0.5 / (GGXV + GGXL);
        }
        
        // Clear Coat visibility
        float V_Kelemen(float LoH) {
            // Kelemen 2001, "A Microfacet Based Coupled Specular-Matte BRDF Model with Importance Sampling"
            return min((0.25 / (LoH * LoH)), 65504.0);
        }
        
        // Cloth shading mode
        half D_Ashikhmin(half roughness, half NoH) {
            // Ashikhmin 2007, "Distribution-based BRDFs"
            half a2 = roughness * roughness;
            half cos2h = NoH * NoH;
            half sin2h = max(1.0 - cos2h, 0.0078125); // 2^(-14/2), so sin2h^2 > 0 in fp16
            half sin4h = sin2h * sin2h;
            half cot2 = -cos2h / (a2 * sin2h);
            return 1.0 / (PI * (4.0 * a2 + 1.0) * sin4h) * (4.0 * exp(cot2) + sin4h);
        }
        
        half D_Charlie(half roughness, half NoH) {
            // Estevez and Kulla 2017, "Production Friendly Microfacet Sheen BRDF"
            half invAlpha  = 1.0 / roughness;
            half cos2h = NoH * NoH;
            half sin2h = max(1.0 - cos2h, 0.0078125); // 2^(-14/2), so sin2h^2 > 0 in fp16
            return (2.0 + invAlpha) * pow(sin2h, invAlpha * 0.5) / (2.0 * PI);
        }
        
        half V_Neubelt(half NoV, half NoL) {
            // Neubelt and Pettineo 2013, "Crafting a Next-gen Material Pipeline for The Order: 1886"
            return min(1.0 / (4.0 * (NoL + NoV - NoL * NoV)), 65504.0);
        }
        
        float Fd_Wrap(float NoL, float w) {
            return saturate((NoL + w) / ((1.0 + w) * (1.0 + w)));
        }
        
        half3 F_Schlick(half u, half3 f0)
        {
            return f0 + (1.0 - f0) * pow(1.0 - u, 5.0);
        }
        
        half3 F_Schlick(half3 f0, half f90, half VoH)
        {
            // Schlick 1994, "An Inexpensive BRDF Model for Physically-Based Rendering"
            return f0 + (f90 - f0) * pow(1.0 - VoH, 5);
        }
        
        float F_Schlick(float f0, float f90, float VoH) {
            return f0 + (f90 - f0) * pow5(1.0 - VoH);
        }
        
        half3 fresnel(half3 f0, half LoH)
        {
            half f90 = saturate(dot(f0, half(50.0 / 3).xxx));
            return F_Schlick(f0, f90, LoH);
        }
        
        half Fd_Burley(half perceptualRoughness, half NoV, half NoL, half LoH)
        {
            // Burley 2012, "Physically-Based Shading at Disney"
            half f90 = 0.5 + 2.0 * perceptualRoughness * LoH * LoH;
            half lightScatter = F_Schlick(1.0, f90, NoL);
            half viewScatter = F_Schlick(1.0, f90, NoV);
            return lightScatter * viewScatter;
        }
        
        // These are taken from David M's improved box projection code https://github.com/frostbone25/Unity-Improved-Box-Projected-Reflections
        //SOURCE - https://github.com/Unity-Technologies/Graphics/blob/504e639c4e07492f74716f36acf7aad0294af16e/Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightEvaluation.hlsl  
        //From Moving Frostbite to PBR document
        //This function fakes the roughness based integration of reflection probes by adjusting the roughness value
        //NOTE: Untouched from HDRP
        float ComputeDistanceBaseRoughness(float distanceIntersectionToShadedPoint, float distanceIntersectionToProbeCenter, float perceptualRoughness)
        {
            float newPerceptualRoughness = clamp(distanceIntersectionToShadedPoint / distanceIntersectionToProbeCenter * perceptualRoughness, 0, perceptualRoughness);
            return lerp(newPerceptualRoughness, perceptualRoughness, perceptualRoughness);
        }
        
        //SOURCE - https://github.com/Unity-Technologies/Graphics/blob/504e639c4e07492f74716f36acf7aad0294af16e/Packages/com.unity.render-pipelines.core/ShaderLibrary/GeometricTools.hlsl#L78
        //This simplified version assume that we care about the result only when we are inside the box
        //NOTE: Untouched from HDRP
        float IntersectRayAABBSimple(float3 start, float3 dir, float3 boxMin, float3 boxMax)
        {
            float3 invDir = rcp(dir);
        
            // Find the ray intersection with box plane
            float3 rbmin = (boxMin - start) * invDir;
            float3 rbmax = (boxMax - start) * invDir;
        
            float3 rbminmax = float3((dir.x > 0.0) ? rbmax.x : rbmin.x, (dir.y > 0.0) ? rbmax.y : rbmin.y, (dir.z > 0.0) ? rbmax.z : rbmin.z);
        
            return min(min(rbminmax.x, rbminmax.y), rbminmax.z);
        }
        
        //SOURCE - https://github.com/Unity-Technologies/Graphics/blob/504e639c4e07492f74716f36acf7aad0294af16e/Packages/com.unity.render-pipelines.high-definition/Runtime/Lighting/LightEvaluation.hlsl  
        //return projectionDistance, can be used in ComputeDistanceBaseRoughness formula
        //return in R the unormalized corrected direction which is used to fetch cubemap but also its length represent the distance of the capture point to the intersection
        //Length R can be reuse as a parameter of ComputeDistanceBaseRoughness for distIntersectionToProbeCenter
        //NOTE: Modified to be much simpler, and to work with the Built-In Render Pipeline (BIRP)
        float EvaluateLight_EnvIntersection(float3 worldSpacePosition, inout float3 R, float4 probePosition, float4 boxMin, float4 boxMax)
        {
            float projectionDistance = IntersectRayAABBSimple(worldSpacePosition, R, boxMin.xyz, boxMax.xyz);
        
            R = (worldSpacePosition + projectionDistance * R) - probePosition.xyz;
        
            return projectionDistance;
        }
        
        half3 getBoxProjection(half3 direction, half3 position, half4 cubemapPosition, half3 boxMin, half3 boxMax)
        {
            #if defined(UNITY_SPECCUBE_BOX_PROJECTION) && !defined(UNITY_PBS_USE_BRDF2) || defined(FORCE_BOX_PROJECTION)
            if (cubemapPosition.w > 0)
            {
                half3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
                half scalar = min(min(factors.x, factors.y), factors.z);
                direction = direction * scalar + (position - cubemapPosition.xyz);
            }
            #endif
        
            return direction;
        }
        
        half3 getEnvReflectionDirect(float3 reflDir, half3 worldSpacePosition, half3 normal, half roughness, int mip, inout half4 rawProbe0)
        {
            half3 env = 0;
        
            float mipLevel = (float) mip;
            if (mip == -1)
            {
                mipLevel = perceptualRoughnessToMipmapLevel(roughness*(1.7 - 0.7*roughness));
            }
        
            half3 reflectionUV1 = getBoxProjection(reflDir, worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin.xyz, unity_SpecCube0_BoxMax.xyz);
            half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, mipLevel);
            rawProbe0 = probe0;
            half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
        
            half3 indirectSpecular;
            half interpolator = unity_SpecCube0_BoxMin.w;
        
            indirectSpecular = probe0sample;
        
            #if defined(UNITY_SPECCUBE_BLENDING) || defined(FORCE_BOX_PROJECTION)
            UNITY_BRANCH
            if (interpolator < 0.99999)
            {
                half3 reflectionUV2 = getBoxProjection(reflDir, worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin.xyz, unity_SpecCube1_BoxMax.xyz);
                half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, mipLevel);
                half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
            }
            #endif
        
            env = indirectSpecular;
            return env;
        }
        
        half3 getEnvReflectionDirect(float3 reflDir, half3 worldSpacePosition, half3 normal, half roughness, int mip)
        {
            half4 rawProbe0;
            return getEnvReflectionDirect(reflDir, worldSpacePosition, normal, roughness, mip, rawProbe0);
        }
        
        half3 getEnvReflectionHardened(float3 reflDir, half3 worldSpacePosition, half roughness, half hardenStrength)
        {
            float3 boxProjectedReflDir = reflDir;
            float projectionDistance = EvaluateLight_EnvIntersection(worldSpacePosition, boxProjectedReflDir, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
            float distanceBasedRoughness = ComputeDistanceBaseRoughness(projectionDistance, length(boxProjectedReflDir), roughness);
                
            distanceBasedRoughness = lerp(roughness, distanceBasedRoughness, hardenStrength);
            float mipLevel = perceptualRoughnessToMipmapLevel(distanceBasedRoughness * (1.7 - 0.7 * distanceBasedRoughness));
        
            half4 probe0data = SAMPLE_TEXTURECUBE_LOD(unity_SpecCube0, samplerunity_SpecCube0, boxProjectedReflDir, mipLevel);
            half3 probe0 = DecodeHDR(probe0data, unity_SpecCube0_HDR);
        
            half3 indirectSpecular = probe0;
        
        
            #if defined(UNITY_SPECCUBE_BLENDING) || defined(FORCE_BOX_PROJECTION)
            UNITY_BRANCH
            if (unity_SpecCube0_BoxMin.w < 0.99999)
            {
                boxProjectedReflDir = reflDir;
                distanceBasedRoughness = roughness;
                if (unity_SpecCube1_ProbePosition.w > 0)
                {
                    projectionDistance = EvaluateLight_EnvIntersection(worldSpacePosition, boxProjectedReflDir, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                    distanceBasedRoughness = ComputeDistanceBaseRoughness(projectionDistance, length(boxProjectedReflDir), roughness);
                    distanceBasedRoughness = lerp(roughness, distanceBasedRoughness, hardenStrength);
                }
                    
                mipLevel = perceptualRoughnessToMipmapLevel(distanceBasedRoughness * (1.7 - 0.7 * distanceBasedRoughness));
                half4 probe1data = SAMPLE_TEXTURECUBE_LOD(unity_SpecCube1, samplerunity_SpecCube0, boxProjectedReflDir, mipLevel);
                half3 probe1 = DecodeHDR(probe1data, unity_SpecCube1_HDR);
        
                indirectSpecular = lerp(probe1, probe0, unity_SpecCube0_BoxMin.w);
            }
            #endif
            return indirectSpecular;
        }
        
        half3 getEnvReflection(half3 worldSpaceViewDir, half3 worldSpacePosition, half3 normal, half smoothness)
        {
            float3 reflDir = reflect(worldSpaceViewDir, normal);
            half perceptualRoughness = 1 - smoothness;
            reflDir = lerp(reflDir, normal, max(perceptualRoughness * perceptualRoughness, 0.002));
            perceptualRoughness = perceptualRoughness * (1.7 - 0.7 * perceptualRoughness);
        
            return getEnvReflectionDirect(reflDir, worldSpacePosition, normal, perceptualRoughness, -1);
        }
        
        half3 getEnvReflection(half3 worldSpaceViewDir, half3 worldSpacePosition, half3 normal, half smoothness, int mip)
        {
            float3 reflDir = reflect(worldSpaceViewDir, normal);
            half perceptualRoughness = 1 - smoothness;
            reflDir = lerp(reflDir, normal, max(perceptualRoughness * perceptualRoughness, 0.002));
            perceptualRoughness = perceptualRoughness * (1.7 - 0.7 * perceptualRoughness);
        
            return getEnvReflectionDirect(reflDir, worldSpacePosition, normal, perceptualRoughness, mip);
        }
        
        half3 EnvBRDFMultiscatter(half2 dfg, half3 f0)
        {
            return lerp(dfg.xxx, dfg.yyy, f0);
        }
        
        half3 EnvBRDFApprox(half perceptualRoughness, half NoV, half3 f0)
        {
            half g = 1 - perceptualRoughness;
            //https://blog.selfshadow.com/publications/s2013-shading-course/lazarov/s2013_pbs_black_ops_2_notes.pdf
            half4 t = half4(1 / 0.96, 0.475, (0.0275 - 0.25 * 0.04) / 0.96, 0.25);
            t *= half4(g, g, g, g);
            t += half4(0, 0, (0.015 - 0.75 * 0.04) / 0.96, 0.75);
            half a0 = t.x * min(t.y, exp2(-9.28 * NoV)) + t.z;
            half a1 = t.w;
            return saturate(lerp(a0, a1, f0));
        }
        
        half GSAA_Filament(half3 worldNormal, half perceptualRoughness, half inputVariance, half threshold)
        {
            // Kaplanyan 2016, "Stable specular highlights"
            // Tokuyoshi 2017, "Error Reduction and Simplification for Shading Anti-Aliasing"
            // Tokuyoshi and Kaplanyan 2019, "Improved Geometric Specular Antialiasing"
        
            // This implementation is meant for deferred rendering in the original paper but
            // we use it in forward rendering as well (as discussed in Tokuyoshi and Kaplanyan
            // 2019). The main reason is that the forward version requires an expensive transform
            // of the half vector by the tangent frame for every light. This is therefore an
            // approximation but it works well enough for our needs and provides an improvement
            // over our original implementation based on Vlachos 2015, "Advanced VR Rendering".
        
            half3 du = ddx(worldNormal);
            half3 dv = ddy(worldNormal);
        
            half variance = inputVariance * (dot(du, du) + dot(dv, dv));
        
            half roughness = perceptualRoughness * perceptualRoughness;
            half kernelRoughness = min(2.0 * variance, threshold);
            half squareRoughness = saturate(roughness * roughness + kernelRoughness);
        
            return sqrt(sqrt(squareRoughness));
        }
        
        //https://ndotl.wordpress.com/2018/08/29/baking-artifact-free-lightmaps
        half3 tex2DFastBicubicLightmap(half2 uv, inout half4 bakedColorTex)
        {
            #if !defined(PLAT_QUEST) && defined(BICUBIC_LIGHTMAP)
            half width;
            half height;
            unity_Lightmap.GetDimensions(width, height);
            half x = uv.x * width;
            half y = uv.y * height;
        
        
        
            x -= 0.5f;
            y -= 0.5f;
            half px = floor(x);
            half py = floor(y);
            half fx = x - px;
            half fy = y - py;
        
            // note: we could store these functions in a lookup table texture, but maths is cheap
            half g0x = g0(fx);
            half g1x = g1(fx);
            half h0x = h0(fx);
            half h1x = h1(fx);
            half h0y = h0(fy);
            half h1y = h1(fy);
        
            half4 r = g0(fy) * (g0x * UNITY_SAMPLE_TEX2D(unity_Lightmap, (half2(px + h0x, py + h0y) * 1.0f / width)) +
            g1x * UNITY_SAMPLE_TEX2D(unity_Lightmap, (half2(px + h1x, py + h0y) * 1.0f / width))) +
            g1(fy) * (g0x * UNITY_SAMPLE_TEX2D(unity_Lightmap, (half2(px + h0x, py + h1y) * 1.0f / width)) +
            g1x * UNITY_SAMPLE_TEX2D(unity_Lightmap, (half2(px + h1x, py + h1y) * 1.0f / width)));
            bakedColorTex = r;
            return DecodeLightmap(r);
            #else
            bakedColorTex = UNITY_SAMPLE_TEX2D(unity_Lightmap, uv);
            return DecodeLightmap(bakedColorTex);
            #endif
        }
        
        half3 GetSpecularHighlights(half3 lightColor, half3 f0, float3 worldNormal, float3 halfVector, half LoH, half NoL, half NoV, half roughness, half3 energyCompensation)
        {
            half NoH = saturate(dot(worldNormal, halfVector));
            half3 F = F_Schlick(LoH, f0);
            float D = D_GGX(NoH, roughness);
            half V = V_SmithGGXCorrelated(NoV, NoL, roughness);
            F *= energyCompensation;
        
            return max(0, D * V * F) * lightColor * UNITY_PI;
        }
        
        half3 GetSpecularHighlightsAnisotropic(half3 lightColor, half3 f0, float3 worldNormal, float3 worldTangent, float3 bitangent, float3 halfVector, half LoH, half NoL, half NoV, half roughness, half3 energyCompensation, half anisotropy)
        {
            half NoH = saturate(dot(worldNormal, halfVector));
            half3 F = F_Schlick(LoH, f0);
            float at = max(roughness * (1.0 + anisotropy), 0.001);
            float ab = max(roughness * (1.0 - anisotropy), 0.001);
            float D = D_GGX_Anisotropic(NoH, halfVector, worldTangent, bitangent, at, ab);
            half V = V_SmithGGXCorrelated(NoV, NoL, roughness);
            F *= energyCompensation;
        
            return max(0, D * V * F) * lightColor * UNITY_PI;
        }
        
        half3 GetSpecularHighlightsClearCoat(half3 lightColor, half3 f0, float3 worldNormal, float3 halfVector, half LoH, half roughness, half strength, inout half clearCoatAttenuation)
        {
            half NoH = saturate(dot(worldNormal, halfVector));
            half3 F = F_Schlick(0.04, 1.0, LoH) * strength;
            float D = D_GGX(NoH, roughness);
            half V = V_Kelemen(LoH);
        
            clearCoatAttenuation = 1.0 - F;
        
            return max(0, D * V * F) * lightColor * UNITY_PI;
        }
        
        half3 GetSpecularHighlightsCloth(half3 lightColor, float3 worldNormal, float3 halfVector, half NoL, half NoV, half roughness, half3 energyCompensation, half3 albedoSqrt, int customSheen, half3 sheenColor)
        {
            half NoH = saturate(dot(worldNormal, halfVector));
            half3 F = customSheen ? sheenColor : albedoSqrt;
            float D = D_Charlie(roughness, NoH);
            half V = V_Neubelt(NoV, NoL);
        
            return max(0, D * V * F) * lightColor * UNITY_PI;
        }
        
        half3 GetSpecularHighlights(float3 worldNormal, half3 lightColor, float3 lightDirection, half3 f0, float3 viewDir, half clampedRoughness, half NoV, half3 energyCompensation)
        {
            float3 halfVector = Unity_SafeNormalize(lightDirection + viewDir);
        
            half NoH = saturate(dot(worldNormal, halfVector));
            half NoL = saturate(dot(worldNormal, lightDirection));
            half LoH = saturate(dot(lightDirection, halfVector));
        
            half3 F = F_Schlick(LoH, f0);
            float D = D_GGX(NoH, clampedRoughness);
            half V = V_SmithGGXCorrelated(NoV, NoL, clampedRoughness);
        
            #ifndef UNITY_PBS_USE_BRDF2
            F *= energyCompensation;
            #endif
        
            return max(0, (D * V) * F) * lightColor * NoL * UNITY_PI;
        }
        
        half3 GetSpecularHighlightsCloth(float3 worldNormal, half3 lightColor, float3 lightDirection, half3 f0, float3 viewDir, half clampedRoughness, half NoV, half3 albedoSqrt, int customSheen, half3 sheenColor)
        {
            float3 halfVector = Unity_SafeNormalize(lightDirection + viewDir);
        
            half NoH = saturate(dot(worldNormal, halfVector));
            half NoL = saturate(dot(worldNormal, lightDirection));
            half LoH = saturate(dot(lightDirection, halfVector));
                
            half3 F = customSheen ? sheenColor : albedoSqrt;
            float D = D_Charlie(clampedRoughness, NoH);
            half V = V_Neubelt(NoV, NoL);
        
            return max(0, (D * V) * F) * lightColor * NoL * UNITY_PI;
        }
        
        #ifdef DYNAMICLIGHTMAP_ON
        half3 getRealtimeLightmap(half2 uv, half3 worldNormal)
        {
            half2 realtimeUV = uv;
            half4 bakedCol = tex2DFastBicubicSample(unity_DynamicLightmap, samplerunity_DynamicLightmap, realtimeUV);
            half3 realtimeLightmap = DecodeRealtimeLightmap(bakedCol);
        
            #ifdef DIRLIGHTMAP_COMBINED
            half4 realtimeDirTex = tex2DFastBicubicSample(unity_DynamicDirectionality, samplerunity_DynamicLightmap, realtimeUV);
            realtimeLightmap += DecodeDirectionalLightmap(realtimeLightmap, realtimeDirTex, worldNormal);
            #endif
        
            return realtimeLightmap;
        }
        #endif
        
        #ifdef DYNAMICLIGHTMAP_ON
        half3 getRealtimeLightmap(half2 uv, half3 worldNormal, int disableBicubic)
        {
            half2 realtimeUV = uv;
            half4 bakedCol;
        
            // Sample main lightmap
            #if defined(BICUBIC_LIGHTMAP)
            [branch]
            if (disableBicubic)
            {
                bakedCol = SAMPLE_TEXTURE2D(unity_DynamicLightmap, samplerunity_DynamicLightmap, realtimeUV);
            } else {
                bakedCol = tex2DFastBicubicSample(unity_DynamicLightmap, samplerunity_DynamicLightmap, realtimeUV);
            }
            #else
            bakedCol = SAMPLE_TEXTURE2D(unity_DynamicLightmap, samplerunity_DynamicLightmap, realtimeUV);
            #endif 
            half3 realtimeLightmap = DecodeRealtimeLightmap(bakedCol);
        
            // Sample directional lightmap
            #ifdef DIRLIGHTMAP_COMBINED
            {
                half4 realtimeDirTex;
                #if defined(BICUBIC_LIGHTMAP)
                [branch]
                if (disableBicubic)
                {
                    realtimeDirTex = SAMPLE_TEXTURE2D(unity_DynamicDirectionality, samplerunity_DynamicLightmap, realtimeUV);
                } else {
                    realtimeDirTex = tex2DFastBicubicSample(unity_DynamicDirectionality, samplerunity_DynamicLightmap, realtimeUV);
                }
                #else
                realtimeDirTex = SAMPLE_TEXTURE2D(unity_DynamicDirectionality, samplerunity_DynamicLightmap, realtimeUV);
                #endif 
                realtimeLightmap += DecodeDirectionalLightmap(realtimeLightmap, realtimeDirTex, worldNormal);
            }
            #endif
        
            return realtimeLightmap;
        }
        #endif
        
        half computeSpecularAO(half NoV, half ao, half roughness)
        {
            return saturate(pow(NoV + ao, exp2(-16.0 * roughness - 1.0)) - 1.0 + ao);
        }
        
        half3 gtaoMultiBounce(half visibility, half3 albedo) {
            // Jimenez et al. 2016, "Practical Realtime Strategies for Accurate Indirect Occlusion"
            half3 a =  2.0404 * albedo - 0.3324;
            half3 b = -4.7951 * albedo + 0.6417;
            half3 c =  2.7552 * albedo + 0.6903;
        
            return max((visibility), ((visibility * a + b) * visibility + c) * visibility);
        }
        
        half shEvaluateDiffuseL1Geomerics(half L0, half3 L1, float3 n)
        {
            // average energy
            half R0 = max(0,L0);
        
            // avg direction of incoming light
            half3 R1 = 0.5f * L1;
        
            // directional brightness
            half lenR1 = length(R1);
        
            // linear angle between normal and direction 0-1
            //half q = 0.5f * (1.0f + dot(R1 / lenR1, n));
            //half q = dot(R1 / lenR1, n) * 0.5 + 0.5;
            half q = dot(normalize(R1), n) * 0.5 + 0.5;
            q = isnan(q) ? 1 : q;
            q = saturate(q); // Thanks to ScruffyRuffles for the bug identity.
        
            // power for q
            // lerps from 1 (linear) to 3 (cubic) based on directionality
            half p = 1.0f + 2.0f * (lenR1 / R0);
        
            // dynamic range constant
            // should vary between 4 (highly directional) and 0 (ambient)
            half a = (1.0f - lenR1 / R0) / (1.0f + lenR1 / R0);
        
            return max(0, R0 * (a + (1.0f - a) * (p + 1.0f) * pow(q, p)));
        }
        
        half3 GetNonLinearSH(half3 L0, half3 L1r, half3 L1g, half3 L1b, float3 n)
        {
            half3 result;
            result.r = shEvaluateDiffuseL1Geomerics(L0.r, L1r.xyz, n);
            result.g = shEvaluateDiffuseL1Geomerics(L0.g, L1g.xyz, n);
            result.b = shEvaluateDiffuseL1Geomerics(L0.b, L1b.xyz, n);
            return result;
        }
        
        // Based on bakery's suggestion - use multiply instead of min for the darkest color
        half3 SubtractMainLightWithRealtimeAttenuationFromLightmapMultiply(half3 lightmap, half attenuation, half4 bakedColorTex, half3 normalWorld)
        {
            // Let's try to make realtime shadows work on a surface, which already contains
            // baked lighting and shadowing from the main sun light.
            half3 shadowColor = unity_ShadowColor.rgb;
            half shadowStrength = _LightShadowData.x;
        
            // Summary:
            // 1) Calculate possible value in the shadow by subtracting estimated light contribution from the places occluded by realtime shadow:
            //      a) preserves other baked lights and light bounces
            //      b) eliminates shadows on the geometry facing away from the light
            // 2) Clamp against user defined ShadowColor.
            // 3) Pick original lightmap value, if it is the darkest one.
        
        
            // 1) Gives good estimate of illumination as if light would've been shadowed during the bake.
            //    Preserves bounce and other baked lights
            //    No shadows on the geometry facing away from the light
            half ndotl = LambertTerm (normalWorld, _WorldSpaceLightPos0.xyz);
            half3 estimatedLightContributionMaskedByInverseOfShadow = ndotl * (1- attenuation) * _LightColor0.rgb;
            half3 subtractedLightmap = lightmap - estimatedLightContributionMaskedByInverseOfShadow;
        
            // 2) Allows user to define overall ambient of the scene and control situation when realtime shadow becomes too dark.
            half3 realtimeShadow = max(subtractedLightmap, shadowColor);
            realtimeShadow = lerp(realtimeShadow, lightmap, shadowStrength);
        
            // 3) Pick darkest color
            return lightmap * realtimeShadow;
        }
        
        float4x4 getVertexLightsDir(float3 worldPos) {
            float3 toLightX = float3(unity_4LightPosX0.x, unity_4LightPosY0.x, unity_4LightPosZ0.x);
            float3 toLightY = float3(unity_4LightPosX0.y, unity_4LightPosY0.y, unity_4LightPosZ0.y);
            float3 toLightZ = float3(unity_4LightPosX0.z, unity_4LightPosY0.z, unity_4LightPosZ0.z);
            float3 toLightW = float3(unity_4LightPosX0.w, unity_4LightPosY0.w, unity_4LightPosZ0.w);
        
            float3 dirX = normalize(toLightX - worldPos);
            float3 dirY = length(toLightY) > 0 ? normalize(toLightY - worldPos) : 0;
            float3 dirZ = length(toLightZ) > 0 ? normalize(toLightZ - worldPos) : 0;
            float3 dirW = length(toLightW) > 0 ? normalize(toLightW - worldPos) : 0;
        
            float4x4 retval = 0;
                retval[0] = float4(dirX, 0);
                retval[1] = float4(dirY, 0);
                retval[2] = float4(dirZ, 0);
                retval[3] = float4(dirW, 0);
            return retval;
        }
        
        float4x4 getVertexLightsColors(float3 worldPos, float3 normal, bool usendl = true)
        {
            float4 toLightX = unity_4LightPosX0 - worldPos.x;
            float4 toLightY = unity_4LightPosY0 - worldPos.y;
            float4 toLightZ = unity_4LightPosZ0 - worldPos.z;
        
            float4 lengthSq = 0;
            lengthSq += toLightX * toLightX;
            lengthSq += toLightY * toLightY;
            lengthSq += toLightZ * toLightZ;
            lengthSq = max(lengthSq, 0.000001);
        
            float4 ndl = 0;
            UNITY_BRANCH
            if (usendl) {
                ndl += toLightX * normal.x;
                ndl += toLightY * normal.y;
                ndl += toLightZ * normal.z;
                ndl = max (float4(0,0,0,0), ndl * rsqrt(lengthSq));
                ndl = ndl*0.5+0.5;
            }
        
            float4 atten = 1.0 / (1.0 + lengthSq * unity_4LightAtten0);
            float4 atten2 = saturate(1 - (unity_4LightAtten0 * lengthSq / 25)); // Black magic
            atten = min(atten, atten2 * atten2); // more black magic
            atten *= usendl ? ndl : 1;
                
            float4x4 retval = 0;
                retval[0] = unity_LightColor[0] * atten.x;
                retval[1] = unity_LightColor[1] * atten.y;
                retval[2] = unity_LightColor[2] * atten.z;
                retval[3] = unity_LightColor[3] * atten.w;
            return retval;
        }
        
        float4x4 getVertexLightsColors(float3 worldPos, float3 normal, out float4 attenuation, bool usendl = true)
        {
            float4 toLightX = unity_4LightPosX0 - worldPos.x;
            float4 toLightY = unity_4LightPosY0 - worldPos.y;
            float4 toLightZ = unity_4LightPosZ0 - worldPos.z;
        
            float4 lengthSq = 0;
            lengthSq += toLightX * toLightX;
            lengthSq += toLightY * toLightY;
            lengthSq += toLightZ * toLightZ;
            lengthSq = max(lengthSq, 0.000001);
        
            float4 ndl = 0;
            UNITY_BRANCH
            if (usendl) {
                ndl += toLightX * normal.x;
                ndl += toLightY * normal.y;
                ndl += toLightZ * normal.z;
                ndl = max (float4(0,0,0,0), ndl * rsqrt(lengthSq));
                ndl = ndl*0.5+0.5;
            }
        
            float4 atten = 1.0 / (1.0 + lengthSq * unity_4LightAtten0);
            float4 atten2 = saturate(1 - (unity_4LightAtten0 * lengthSq / 25)); // Black magic
            atten = min(atten, atten2 * atten2); // more black magic
            atten *= usendl ? ndl : 1;
        
            attenuation = atten;
                
            float4x4 retval = 0;
                retval[0] = unity_LightColor[0] * atten.x;
                retval[1] = unity_LightColor[1] * atten.y;
                retval[2] = unity_LightColor[2] * atten.z;
                retval[3] = unity_LightColor[3] * atten.w;
            return retval;
        }
        
        float4 getVertexLightRanges()
        {
            float4 ranges = 5.0 * (1.0 / sqrt(unity_4LightAtten0.xyzw));
                
            if (all(!isnan(ranges))) return ranges;
        
            return float4(
                isnan(ranges.x) ? 0.0 : ranges.x,
                isnan(ranges.y) ? 0.0 : ranges.y,
                isnan(ranges.z) ? 0.0 : ranges.z,
                isnan(ranges.w) ? 0.0 : ranges.w
            );
        }
        
        half3 getReflectionUV(half3 direction, half3 position, half4 cubemapPosition, half3 boxMin, half3 boxMax)
        {
            #if UNITY_SPECCUBE_BOX_PROJECTION
                if (cubemapPosition.w > 0) {
                    half3 factors = ((direction > 0 ? boxMax : boxMin) - position) / direction;
                    half scalar = min(min(factors.x, factors.y), factors.z);
                    direction = direction * scalar + (position - cubemapPosition);
                }
            #endif
            return direction;
        }
        
        half3 calcReflView(half3 viewDir, half3 normal)
        {
            return reflect(-viewDir, normal);
        }
        
        half3 calcStereoViewDir(half3 worldPos)
        {
            #if UNITY_SINGLE_PASS_STEREO
                half3 cameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
            #else
                half3 cameraPos = _WorldSpaceCameraPos;
            #endif
                half3 viewDir = cameraPos - worldPos;
            return normalize(viewDir);
        }
        
        half4 calcDiffuse(half attenuation, half3 albedo, half3 indirectDiffuse, half3 lightCol, half4 ramp)
        {
            half4 diffuse;
            half4 indirect = indirectDiffuse.xyzz;
        
            half grayIndirect = dot(indirectDiffuse, float3(1,1,1));
            half attenFactor = lerp(attenuation, 1, smoothstep(0, 0.2, grayIndirect));
        
            diffuse = ramp * attenFactor * half4(lightCol, 1) + indirect;
            diffuse = albedo.xyzz * diffuse;
            return diffuse;
        }
        
        half2 calcMatcapUV(half3 worldUp, half3 viewDirection, half3 normalDirection)
        {
            half3 worldViewUp = normalize(worldUp - viewDirection * dot(viewDirection, worldUp));
            half3 worldViewRight = normalize(cross(viewDirection, worldViewUp));
            half2 matcapUV = half2(dot(worldViewRight, normalDirection), dot(worldViewUp, normalDirection)) * 0.5 + 0.5;
            return matcapUV;
        }
        ENDCG
        // Global Include End

        // PrePasses

        // Exra PrePasses

                // ForwardBase Depth Prepass
                // ShaderDefines
                // DataStructs
                // GlobalVariables
                // Variables
                // Textures
                // PassFunctions
                // Functions
                // Free Functions
                // ForwardBase Depth Prepass Vertex
                    // ForwardBase Depth Prepass Vertex Chain
                    // ForwardBase Depth Prepass VertexBase
                    // ForwardBase Depth Prepass PostVertex Chain
                // ForwardBase Depth Prepass Fragment
                    // ForwardBase Depth Prepass Fragment Chain
                    // ForwardBase Depth Prepass FragmentBase
                    // ForwardBase Depth Prepass Color Chain
                    // ForwardBase Depth Prepass-only Chain
                // ForwardBase Depth Prepass End

        Pass
        {
            Tags { "LightMode" = "ForwardBase"  }
            Stencil {
                Ref 69
                Comp Always
                Pass [_StencilBasePass]
            }

            // ForwardBase Pass Start
            CGPROGRAM
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma vertex Vertex
            #pragma fragment Fragment
            #pragma shader_feature_local_fragment _NATIVE_A2C
            
            #pragma shader_feature_local_fragment SEPARATE_ALPHA
            
            #pragma shader_feature _AUDIOLINKVERTEX
            
            #pragma shader_feature_local_fragment NORMALS_SET
            #pragma shader_feature_local_fragment DETAIL_NORMALS_SET
            
            #pragma shader_feature_local OUTLINE_ENABLED
            
            #pragma shader_feature_local_fragment SPECULAR_ON
            
            #pragma shader_feature_local_fragment REFLECTION_MODE_OFF REFLECTION_MODE_PBR REFLECTION_MODE_BAKED_CUBEMAP REFLECTION_MODE_MATCAP
            
            #pragma shader_feature_local_fragment AL_MODE_SINGLE_CHANNEL AL_MODE_PACKED_MAP AL_MODE_UV_BASED
            #if !defined(AL_MODE_SINGLE_CHANNEL) && !defined(AL_MODE_PACKED_MAP) && !defined(AL_MODE_UV_BASED)
                #define AL_MODE_NONE
            #endif
            
            #pragma shader_feature_local_fragment _EMISSION
            
            #pragma shader_feature_local_fragment RIMLIGHT_ON
            
            #pragma shader_feature_local_fragment RIMSHADOW_ON
            
            #pragma shader_feature _AUDIOLINKCHROMA
            #pragma shader_feature _CHROMAMAP
            
            #pragma shader_feature _LUMA
            #pragma shader_feature _LUMALEGACY
            #pragma shader_feature _LUMAMAP
            
            #pragma shader_feature _VIDEO
            #pragma shader_feature _VIDEOMAP
            #pragma shader_feature _VIDEOAST
            #pragma shader_feature _VIDEOALBEDO
            
            #pragma shader_feature _CROWDWAVE
            #pragma shader_feature _CROWDWAVERANGE
            
            #pragma shader_feature_local_fragment INTEGRATE_LTCGI
            
            #pragma shader_feature_local_vertex VRC_FEATURES
            
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_INSTANCED_LOD_FADE
            #define UNITY_INSTANCED_SH
            #define UNITY_INSTANCED_LIGHTMAPSTS

            #ifndef UNITY_PASS_FORWARDBASE
                #define UNITY_PASS_FORWARDBASE
            #endif

            // ShaderDefines
            #define NEED_FRAGMENT_IN_SHADOW
            #define NEED_ALBEDO_ALPHA
            
            #define GLOBAL_UV_SET
            
            #define PIXEL_NORMAL_SET
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #if defined(INTEGRATE_LTCGI)
                #define _INTEGRATE_CUSTOMGI_FLEX
            #endif
            
            #define INCLUDE_LTCGI defined(INTEGRATE_LTCGI)
            
            #if INCLUDE_LTCGI
                #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI_structs.cginc"
            #endif
            
            #define ORL_LIGHTING_MODEL_TOON
            
            #if defined(UNITY_PBS_USE_BRDF2) || defined(SHADER_API_MOBILE)
                #define PLAT_QUEST
            #else
                #ifdef PLAT_QUEST
                    #undef PLAT_QUEST
                #endif
            #endif
            
            #define NEED_SCREEN_POS
            
            #define grayscaleVec float3(0.2125, 0.7154, 0.0721)
            // DataStructs
            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 color : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD7;
                #endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct FragmentData
            {
                #if defined(UNITY_PASS_SHADOWCASTER)
                V2F_SHADOW_CASTER;
                #else
                float4 pos : SV_POSITION;
                #endif
                    
                float3 normal : RAW_NORMAL;
                float4 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 uv2 : TEXCOORD3;
                float4 uv3 : TEXCOORD4;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD5;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD6;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD7;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD8;
                #endif
                float3 worldPos : WORLD_POS;
                float3 worldNormal : WORLD_NORMAL;
                float4 worldTangent : WORLD_TANGENT;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                float4 lightmapUv : LM_UV;
                #endif
                centroid float4 vertexColor : VERTEX_COLOR;
            
                #if !defined(UNITY_PASS_META)
                UNITY_LIGHTING_COORDS(9, 10)
                UNITY_FOG_COORDS(11)
                #endif
            
                #if defined(EDITOR_VISUALIZATION)
                float2 vizUV : VIZ_UV;
                float4 lightCoord : LIGHT_COORD;
                #endif
                  
                #if defined(NEED_SCREEN_POS)
                float4 screenPos: SCREENPOS;
                #endif
            
                #if defined(EXTRA_V2F_0)
                float4 extraV2F0 : EXTRA_V2F_BLOCK0;
                #endif
                #if defined(EXTRA_V2F_1)
                float4 extraV2F1 : EXTRA_V2F_BLOCK1;
                #endif
                #if defined(EXTRA_V2F_2)
                float4 extraV2F2 : EXTRA_V2F_BLOCK2;
                #endif
                #if defined(EXTRA_V2F_3)
                float4 extraV2F3 : EXTRA_V2F_BLOCK3;
                #endif
            
                // Additional Fragment Data
                
                // Additional Fragment Data End
            
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            struct LTCGIAccumulatorStruct {
                float3 diffuse;
                float3 specular;
            };
            
            #define LTCGI_V2_CUSTOM_INPUT LTCGIAccumulatorStruct
            
            struct MeshData
            {
                float4 uv0;
                float4 uv1;
                float4 uv2;
                float4 uv3;
                #if defined(NEED_UV4)
                float4 uv4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half4 lightmapUv;
                #endif
                half4 vertexColor;
                half3 normal;
                half3 worldNormal;
                half3 localSpacePosition;
                half3 worldSpacePosition;
                half3 worldSpaceViewDir;
                half3 worldSpaceTangent;
                half3 tangentSpaceViewDir;
                float3x3 TBNMatrix;
                half3 bitangent;
                half3 svdn;
                float4 extraV2F0;
                float4 extraV2F1;
                float4 extraV2F2;
                float4 extraV2F3;
                float4 screenPos;
            
                // Additional Mesh Data
                
                // Additional Mesh Data End
            };
            
            MeshData CreateMeshData(FragmentData i, bool facing)
            {
                MeshData d = (MeshData) 0;
                d.uv0 = i.uv0;
                d.uv1 = i.uv1;
                d.uv2 = i.uv2;
                d.uv3 = i.uv3;
                #if defined(NEED_UV4)
                d.uv4 = i.uv4;
                #endif
                #if defined(NEED_UV5)
                d.uv5 = i.uv5;
                #endif
                #if defined(NEED_UV6)
                d.uv6 = i.uv6;
                #endif
                #if defined(NEED_UV7)
                d.uv7 = i.uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.lightmapUv = i.lightmapUv;
                #endif
                d.worldNormal = normalize(i.worldNormal);
                d.localSpacePosition = mul(unity_WorldToObject, float4(i.worldPos, 1)).xyz;
                d.worldSpacePosition = i.worldPos;
                d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
            
                d.normal = i.normal;
                d.vertexColor = i.vertexColor;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.bitangent = normalize(cross(i.worldTangent.xyz, d.worldNormal) * i.worldTangent.w * - 1);
                d.worldSpaceTangent = normalize(i.worldTangent.xyz);
                d.TBNMatrix = float3x3(normalize(i.worldTangent.xyz), d.bitangent, d.worldNormal);
                d.TBNMatrix[2].xyz *= facing ? 1 : -1;
                d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
                #endif
            
                #if UNITY_SINGLE_PASS_STEREO
                half3 stereoCameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
                d.svdn = normalize(stereoCameraPos - d.worldSpacePosition);
                #else
                d.svdn = d.worldSpaceViewDir;
                #endif
            
                #if defined(EXTRA_V2F_0)
                d.extraV2F0 = i.extraV2F0;
                #endif
                #if defined(EXTRA_V2F_1)
                d.extraV2F1 = i.extraV2F1;
                #endif
                #if defined(EXTRA_V2F_2)
                d.extraV2F2 = i.extraV2F2;
                #endif
                #if defined(EXTRA_V2F_3)
                d.extraV2F3 = i.extraV2F3;
                #endif
                #if defined(NEED_SCREEN_POS)
                d.screenPos = i.screenPos;
                #endif
            
                // Additional Mesh Data Creator
                
                // Additional Mesh Data Creator End
            
                return d;
            }
            
            struct SurfaceData
            {
                half3 Albedo;
                half Alpha;
                half Hue;
                half Saturation;
                half Value;
                    
                half Metallic;
                half Smoothness;
                half Anisotropy;
                half3 Normal;
                    
                half Occlusion;
                int OcclusionMode;
            
                half3 Emission;
                int EmissionScaleWithLight;
                half EmissionLightThreshold;
                    
                half ShadowSharpness;
                    
                half4 RimLight;
                half RimAttenuation;
                half4 RimShadow;
                    
                half SpecularIntensity;
                half SpecularArea;
                half SpecularAlbedoTint;
                half SpecularAnisotropy;
                half SpecularSharpness;
                    
                half Reflectivity;
                half3 BakedReflection;
                half ReflectionBlendMode;
                    
                half3 OutlineColor;
                int OutlineLightingMode;
            
                // Additional Surface Data
                
                // Additional Surface Data End
            };
            
            SurfaceData CreateSurfaceData()
            {
                SurfaceData o = (SurfaceData) 0;
                o.Albedo = 0.5;
                o.Occlusion = 1;
                o.Normal = half3(0, 0, 1);
                o.Smoothness = 0.5;
                o.Alpha = 1;
                o.RimShadow = 1;
                o.RimAttenuation = 1;
                return o;
            }
            // GlobalVariables

            // Variables
            float4 _MainTex_ST;
            int _MainTexUVSet;
            int _TintByVertexColor;
            half4 _Color;
            half4 _BackfaceColor;
            half _BackfaceAlbedoTint;
            half _AlphaScale;
            half _Hue;
            half _Saturation;
            half _Value;
            half _ShadowSharpness;
            half2 GLOBAL_uv;
            int _OcclusionMode;
            half _OcclusionStrength;
            int _OcclusionTilingMode;
            half _OcclusionTiling;
            int _OcclusionDetailEnabled;
            half _OcclusionDetailStrength;
            int _OcclusionDetailTilingMode;
            half _OcclusionDetailTiling;
            #if defined(_AUDIOLINKVERTEX)
                uniform int _EnableAudioLinkVertex;
            #endif
            uniform fixed4 _AudioLinkVertexMap_ST;
            uniform half _AudioLinkVertexHistory;
            uniform int _AudioLinkVertexBand;
            uniform half _AudioLinkVertexIntensity;
            int _BumpMapTilingMode;
            float _BumpMapTiling;
            half _BumpScale;
            int _FlipBumpY;
            int _NormalBicubicSampling;
            half4 _DetailNormalMap_ST;
            int _DetailNormalsUVSet;
            half _DetailNormalTiling;
            half _DetailNormalScale;
            half _FlipDetailNormalY;
            int _DetailNormalMaskUVSet;
            half _DetailNormalMaskTiling;
            half3 GLOBAL_pixelNormal;
            int _StencilBasePass;
            int _StencilBaseComp;
            int _StencilOutlineComp;
            half4 _OutlineColor;
            int _OutlineLightingMode;
            half _OutlineAlbedoTint;
            half4 _OutlineMask_ST;
            half _OutlineWidth;
            int _OutlineWidthAdjustByVertexColor;
            int _SpecularMapUVSet;
            int _SpecularTilingMode;
            half _SpecularTiling;
            half _SpecularIntensity;
            half _SpecularRoughness;
            half _SpecularSharpness;
            half _SpecularAnisotropy;
            half _SpecularAlbedoTint;
            int _SpecularMaskTilingMode;
            half _SpecularMaskTiling;
            half _SpecularMaskStrength;
            int _ReflectionMode;
            half _ReflectionBlendMode;
            half _Smoothness;
            half _Metallic;
            int _RoughnessMode;
            int _MetallicGlossMapTilingMode;
            half _MetallicGlossMapTiling;
            half4 _MetallicRemap;
            half4 _SmoothnessRemap;
            half4 _MetallicGlossMap_TexelSize;
            half _ReflectionAnisotropy;
            half _MatcapBlur;
            half _MatcapTintToDiffuse;
            int _ReflectivityMaskTilingMode;
            half _ReflectivityMaskTiling;
            half _ReflectivityLevel;
            int _ALBand;
            half4 _ALEmissionColor;
            int _ALEmissionDotMask;
            int _ALEmissionDotMaskInvert;
            half _ALEmissionDotMaskSmoothing;
            int _ALGradientOnRed;
            int _ALGradientOnGreen;
            int _ALGradientOnBlue;
            half4 _ALPackedRedColor;
            half4 _ALPackedGreenColor;
            half4 _ALPackedBlueColor;
            int _ALSmoothingLevel;
            int _ALUVWidth;
            int _ALMapUVSet;
            half4 _EmissionColor;
            half _EmissionTintToDiffuse;
            int _EmissionScaleWithLight;
            half _EmissionScaleWithLightSensitivity;
            half4 _RimTint;
            half _RimIntensity;
            half _RimAlbedoTint;
            half _RimEnvironmentTint;
            half _RimAttenuation;
            half _RimRange;
            half _RimThreshold;
            half _RimSharpness;
            half4 _ShadowRimTint;
            half _ShadowRimRange;
            half _ShadowRimThreshold;
            half _ShadowRimSharpness;
            half _ShadowRimAlbedoTint;
            #if defined(_AUDIOLINKCHROMA)
                uniform int _EnableAudioLinkChroma;
            #endif
            uniform float4 _ChromaMask_ST;
            uniform fixed4 _ChromaTint;
            uniform int _ChromaForceIdle;
            uniform int _ChromaModeR;
            uniform int _ChromaModeG;
            uniform int _ChromaModeB;
            uniform fixed _ChromaHistory;
            uniform half _ChromaWarp;
            uniform half _ChromaSpeed;
            uniform half _ChromaBiased;
            uniform int _ChromaForceTheme;
            uniform fixed4 _ChromaTheme0;
            uniform fixed4 _ChromaTheme1;
            uniform fixed4 _ChromaTheme2;
            uniform fixed4 _ChromaTheme3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
                uniform int _ReactPriority;
            #endif
            #if !defined(_CHROMAMAP)
                uniform int _ChromaBand;
                uniform fixed _ChromaRotation;
            #endif
            #if defined(_LUMA)
                uniform int _EnableLuma;
            #endif
            #if defined(_LUMALEGACY)
                uniform fixed4 _Stored_TexelSize;
                const static int GRADSTART[3] = { LUMA_LEGACY_GRAD_START1, LUMA_LEGACY_GRAD_START2, LUMA_LEGACY_GRAD_START3 };
            #endif
            uniform float4 _LumaMask_ST;
            uniform fixed4 _LumaTint;
            uniform half _LumaWarp;
            uniform half _LumaBiased;
            uniform int _LumaGrad1;
            uniform int _LumaGrad2;
            uniform int _LumaGrad3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
            #endif
            #if !defined(_LUMAMAP)
                uniform fixed _LumaRotation;
            #endif
            #if defined(_VIDEO)
                uniform int _EnableVideo;
            #endif
            #ifndef _UDON_VIDEOTEX_ST
                #define _UDON_VIDEOTEX_ST
                uniform float4 _Udon_VideoTex_ST;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
                uniform float4 _Udon_VideoTex_TexelSize;
            #endif
            uniform fixed4 _VideoTint;
            uniform float4 _VideoMask_ST;
            #if !defined(_VIDEOMAP)
                uniform fixed _VideoRatio;
                uniform fixed _VideoRotation;
            #endif
            #if defined(_CROWDWAVE)
                uniform int _EnableCrowdwave;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
            #endif
            uniform fixed4 _CrowdwaveTint;
            uniform half _CrowdwaveBias;
            uniform float4 _CrowdwaveMask_ST;
            uniform float4x4 _Udon_CrowdwaveMeta;
            int _LTCGIEnableOnMobile;
            int _LTCGIClampBrightness;
            half _LTCGIMaxBrightness;
            half _LTCGIDiffuseIntensity;
            half _LTCGISpecularIntensity;
            half _LTCGIRoughnessModifier;
            int _LTCGIAlphaPremultiply;
            half _SheenStrength;
            half _SheenPower;
            half4 _SheenTint;
            half _SheenAlbedoTint;
            int _SheenBlendType;
            half4 _SheenMask_ST;
            int _VRCHideInVR;
            int _VRCHideInDesktop;
            int _VRCHideInVRCamera;
            int _VRCHideInDesktopCamera;
            int _VRCHideInVRMirror;
            int _VRCHideInDesktopMirror;
            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            int _IgnoreLightprobeNormal;
            int _MinLight;
            half _MonochromeLighting;
            int _RenderType;
            half _Cutoff;

            // Textures
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            #if defined(SEPARATE_ALPHA)
            TEXTURE2D(_AlphaTex);
            #endif
            TEXTURE2D(_OcclusionMap);
            TEXTURE2D(_OcclusionDetail);
            TEXTURE2D(_AudioLinkVertexMap);
            SAMPLER(sampler_AudioLinkVertexMap);
            TEXTURE2D(_BumpMap);
            SAMPLER(sampler_BumpMap);
            TEXTURE2D(_DetailNormalMap);
            SAMPLER(sampler_DetailNormalMap);
            TEXTURE2D(_DetailNormalMask);
            SAMPLER(sampler_DetailNormalMask);
            TEXTURE2D(_OutlineTex);
            TEXTURE2D(_OutlineMask);
            SAMPLER(sampler_OutlineTex);
            SAMPLER(sampler_OutlineMask);
            TEXTURE2D(_SpecularMap);
            TEXTURE2D(_SpecularMask);
            TEXTURE2D(_Matcap);
            SAMPLER(sampler_Matcap);
            TEXTURE2D(_MetallicGlossMap);
            TEXTURE2D(_ReflectivityMask);
            TEXTURE2D(_ALMap);
            SAMPLER(sampler_ALMap);
            TEXTURE2D(_EmissionMap);
            TEXTURE2D(_ChromaMask);
            #if defined(_CHROMAMAP)
                TEXTURE2D(_ChromaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                    TEXTURE2D(_Stored);
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
                SAMPLER(bilinear_clamp);
            #endif
            TEXTURE2D(_LumaMask);
            #if defined(_LUMAMAP)
                TEXTURE2D(_LumaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef POINT_CLAMP
                #define POINT_CLAMP
                SAMPLER(point_clamp);
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
                TEXTURE2D(_Udon_VideoTex);
            #endif
            TEXTURE2D(_VideoMask);
            TEXTURE2D(_VideoFallback);
            #if defined(_VIDEOMAP)
                TEXTURE2D(_VideoMap);
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
            #endif
            TEXTURE2D(_Udon_CrowdwaveMask);
            TEXTURE2D(_CrowdwaveMask);
            SAMPLER(sampler_Udon_CrowdwaveMask);
            SAMPLER(sampler_CrowdwaveMask);
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            TEXTURE2D(_LTCGIRamp);
            SAMPLER(sampler_LTCGIRamp);
            TEXTURE2D(_SheenMask);
            SAMPLER(sampler_SheenMask);
            TEXTURE2D(_Ramp);
            SAMPLER(sampler_Ramp);
            TEXTURECUBE(_BakedCubemap);
            SAMPLER(sampler_BakedCubemap);

            // PassFunctions
            #if INCLUDE_LTCGI
            
            void LTCGICallbackDiffuse(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.diffuse += output.intensity * output.color;
            }
            
            void LTCGICallbackSpecular(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.specular += output.intensity * output.color;
            }    
            
            #define LTCGI_V2_DIFFUSE_CALLBACK LTCGICallbackDiffuse
            #define LTCGI_V2_SPECULAR_CALLBACK LTCGICallbackSpecular
                
            #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI.cginc"
            #endif

            // Functions
            void ToonMainFragment(MeshData d, inout SurfaceData o, bool facing)
            {
                half2 uv = 0;
                switch (_MainTexUVSet) {
                    case 0: uv = d.uv0; break;
                    case 1: uv = d.uv1; break;
                    case 2: uv = d.uv2; break;
                    case 3: uv = d.uv3; break;
                }
                uv = uv * _MainTex_ST.xy + _MainTex_ST.zw;
                GLOBAL_uv = uv;
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, GLOBAL_uv);
                if (facing) {
                    albedo *= _Color;
                } else {
                    albedo = lerp(_BackfaceColor, albedo * _BackfaceColor, _BackfaceAlbedoTint);
                }
                half3 albedoHSV = RGB2HSV(albedo.rgb);
            
                albedoHSV.x = fmod(albedoHSV.x + _Hue, 1);
                albedoHSV.y = saturate(albedoHSV.y + _Saturation);
                albedoHSV.z = saturate(albedoHSV.z + _Value);
                albedo.rgb = HSV2RGB(albedoHSV);
            
                o.Hue = _Hue;
                o.Saturation = _Saturation;
                o.Value = _Value;
                    
                if (_TintByVertexColor) {
                    albedo.rgb *= d.vertexColor.rgb;
                }
                o.Albedo = albedo.rgb;
                #if defined(NEED_ALBEDO_ALPHA)
                {
                    #if defined(SEPARATE_ALPHA) 
                    o.Alpha = saturate(SAMPLE_TEXTURE2D(_AlphaTex, sampler_MainTex, GLOBAL_uv).r * _AlphaScale);
                    #else
                    o.Alpha = saturate(albedo.a * _AlphaScale);
                    #endif
                }
                #else
                o.Alpha = 1;
                #endif
                o.ShadowSharpness = _ShadowSharpness;
            }
            

            void ToonOcclusionFragment(MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half occlusion = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_MainTex, lerp(globalUv * _OcclusionTiling, d.uv0 * _OcclusionTiling, _OcclusionTilingMode)).r;
                o.Occlusion = lerp(1, occlusion, _OcclusionStrength);
                    
                if (_OcclusionDetailEnabled) {
                    half occlusionDetail = SAMPLE_TEXTURE2D(_OcclusionDetail, sampler_MainTex, lerp(globalUv * _OcclusionDetailTiling, d.uv0 * _OcclusionDetailTiling, _OcclusionDetailTilingMode)).r;
                    o.Occlusion *= lerp(1, occlusionDetail, _OcclusionDetailStrength);
                }
            
                o.OcclusionMode = _OcclusionMode;
            }
            

            
                float4 QuanternionMultiply(float4 a, float4 b)
                {
            
                    return float4(a.w * b.xyz + b.w * a.xyz + cross(a.xyz, b.xyz), a.w * b.w - dot(a.xyz, b.xyz));
                }
            
                float3 QuanternionRotate(float3 pos, float3 vec, float rotate)
                {
            
                    rotate /= 2.0;
            
                    float4 quat1 = float4(vec.xyz, cos(rotate));
                    quat1.xyz *= sin(rotate);
            
                    float4 quat2 = float4(-quat1.x, -quat1.y, -quat1.z, quat1.w);
            
                    float4 mulpos = (quat1 * float4(pos, 0.0)) * quat2;
                    mulpos = QuanternionMultiply(QuanternionMultiply(quat1, float4(pos, 0.0)), quat2);
            
                    return mulpos;
            
                }
            
                void AudioLinkVertex(inout VertexData v)
                {
                    #if defined(_AUDIOLINKVERTEX)
            
                        if (!_EnableAudioLinkVertex) return;
            
                        half2 map = _AudioLinkVertexMap.SampleLevel(sampler_AudioLinkVertexMap, TRANSFORM_TEX(v.uv0.xy, _AudioLinkVertexMap), 0).rg;
                        half value = AudioLinkIsAvailable() ? AudioLinkLerp(float2(map.g * _AudioLinkVertexHistory, _AudioLinkVertexBand)).r * _AudioLinkVertexIntensity : 0.0;
            
                        v.vertex.xyz += v.normal.xyz * value * map.r;
            
                    #endif
                }
            

            void ToonNormalsFragment(inout MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                #if defined(NORMALS_SET)
                float4 normalTex = 0;
                if (_NormalBicubicSampling) {
                    normalTex = tex2DFastBicubicSampleNoChecks(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                } else {
                    normalTex = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                }
                if (_FlipBumpY)
                {
                    normalTex.y = 1 - normalTex.y;
                }
                half3 normal = UnpackNormalScale(normalTex, _BumpScale);
            
                o.Normal = BlendNormals(o.Normal, normal);
                #endif
                    
                #if defined(DETAIL_NORMALS_SET)
                    
                half2 detailUV = 0;
                switch (_DetailNormalsUVSet) {
                    case 0: detailUV = d.uv0; break;
                    case 1: detailUV = d.uv1; break;
                    case 2: detailUV = d.uv2; break;
                    case 3: detailUV = d.uv3; break;
                }
                detailUV = detailUV * _DetailNormalTiling;
                half4 detailNormalTex = SAMPLE_TEXTURE2D(_DetailNormalMap, sampler_DetailNormalMap, detailUV);
                if (_FlipDetailNormalY)
                {
                    detailNormalTex.y = 1 - detailNormalTex.y;
                }
            
                half2 detailMaskUV = 0;
                switch (_DetailNormalMaskUVSet) {
                    case 0: detailMaskUV = d.uv0; break;
                    case 1: detailMaskUV = d.uv1; break;
                    case 2: detailMaskUV = d.uv2; break;
                    case 3: detailMaskUV = d.uv3; break;
                }
                detailMaskUV *= _DetailNormalMaskTiling;
                half detailMask = SAMPLE_TEXTURE2D(_DetailNormalMask, sampler_DetailNormalMask, detailMaskUV).r;
            
                half3 detailNormal = UnpackNormalScale(detailNormalTex, _DetailNormalScale);
                    
                o.Normal = lerp(o.Normal, BlendNormals(o.Normal, detailNormal), detailMask);
            
                #endif
            
                #if defined(NORMALS_SET) || defined(DETAIL_NORMALS_SET)
            
                half3 properNormal = normalize(mul(o.Normal, d.TBNMatrix));
                d.worldSpaceTangent.xyz = cross(d.bitangent.xyz, properNormal);
                d.bitangent.xyz = cross(properNormal, d.worldSpaceTangent.xyz);
                d.TBNMatrix = float3x3(normalize(d.worldSpaceTangent.xyz), d.bitangent, d.worldNormal);
                GLOBAL_pixelNormal = properNormal;
            
                #else
            
                GLOBAL_pixelNormal = normalize(mul(o.Normal, d.TBNMatrix));
            
                #endif
            }
            

            void ToonOutlineVertex(inout VertexData v) {
                #if defined(PASS_OUTLINE)
                half mask = SAMPLE_TEXTURE2D_LOD(_OutlineMask, sampler_OutlineMask, TRANSFORM_TEX(v.uv0, _OutlineMask), 0);
                half3 width = mask * _OutlineWidth * .01;
                width *= min(distance(TransformObjectToWorld(v.vertex.xyz), _WorldSpaceCameraPos) * 3, 1);
                v.vertex.xyz += v.normal.xyz * lerp(width, width * v.color.r, _OutlineWidthAdjustByVertexColor);
                    
                #endif
            }
            

            void ToonOutlineFragment(MeshData d, inout SurfaceData o) {
                half3 outline = SAMPLE_TEXTURE2D(_OutlineTex, sampler_OutlineTex, d.uv0).rgb;
                o.OutlineColor = lerp(_OutlineColor * outline, _OutlineColor * outline * o.Albedo, _OutlineAlbedoTint);
                o.OutlineLightingMode = _OutlineLightingMode;
            }
            

            void ToonSpecularFragment(MeshData d, inout SurfaceData o) {
                #if defined(SPECULAR_ON)
                    
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half2 specularUv = lerp(globalUv * _SpecularTiling, d.uv0 * _SpecularTiling, _SpecularTilingMode);
                half2 specularMaskUv = lerp(globalUv * _SpecularMaskTiling, d.uv0 * _SpecularMaskTiling, _SpecularMaskTilingMode);
            
                half3 specMap = SAMPLE_TEXTURE2D(_SpecularMap, sampler_MainTex, specularUv);
                o.SpecularIntensity = max(0, _SpecularIntensity * specMap.r);
                o.SpecularArea = max(0.01, GSAA_Filament(d.worldNormal, _SpecularRoughness, 0.05, 0.1) * specMap.b);
                o.SpecularAnisotropy = _SpecularAnisotropy;
                o.SpecularAlbedoTint = _SpecularAlbedoTint * specMap.g;
                o.SpecularSharpness = _SpecularSharpness;
                o.SpecularArea = lerp(o.SpecularArea, o.SpecularArea * SAMPLE_TEXTURE2D(_SpecularMask, sampler_MainTex, specularMaskUv).r, _SpecularMaskStrength);
                #endif
            }
            

            void ToonReflectionFragment(MeshData d, inout SurfaceData o) {
                #if defined(REFLECTION_MODE_OFF)
                return;
                #endif
            
                o.ReflectionBlendMode = _ReflectionBlendMode;
            
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half mask = SAMPLE_TEXTURE2D(_ReflectivityMask, sampler_MainTex, lerp(globalUv * _ReflectivityMaskTiling, d.uv0 * _ReflectivityMaskTiling, _ReflectivityMaskTilingMode)).r;
                mask *= _ReflectivityLevel;
                    
                #if defined(REFLECTION_MODE_PBR) || defined(REFLECTION_MODE_BAKED_CUBEMAP)
                        
                half4 metalSmooth = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MainTex, lerp(globalUv * _MetallicGlossMapTiling, d.uv0 * _MetallicGlossMapTiling, _MetallicGlossMapTilingMode));
                int hasMetallicSmooth = _MetallicGlossMap_TexelSize.z > 8;
                half metal = metalSmooth.r;
                half smooth = metalSmooth.a;
                if (_RoughnessMode)
                {
                    smooth = 1 - smooth;
                }
                metal = remap(metal, 0, 1, _MetallicRemap.x, _MetallicRemap.y);
                smooth = remap(smooth, 0, 1, _SmoothnessRemap.x, _SmoothnessRemap.y);
                o.Metallic = lerp(_Metallic, metal, hasMetallicSmooth);
                o.Smoothness = lerp(_Smoothness, smooth, hasMetallicSmooth);
                o.Anisotropy = _ReflectionAnisotropy;
                    
                #elif defined(REFLECTION_MODE_MATCAP)
                    
                half3 upVector = half3(0,1,0);
                half2 remapUV = calcMatcapUV(upVector, d.worldSpaceViewDir, GLOBAL_pixelNormal);
                half4 spec = 0; 
                spec = SAMPLE_TEXTURE2D_LOD(_Matcap, sampler_Matcap, remapUV, _MatcapBlur * UNITY_SPECCUBE_LOD_STEPS);
            
                spec.rgb *= lerp(1, o.Albedo, _MatcapTintToDiffuse);
                o.BakedReflection = spec.rgb;
                    
                #endif
            
                o.Reflectivity = mask;
            }
            

            void ToonALFragment(MeshData d, inout SurfaceData o) {
                #if defined(AL_MODE_NONE)
                    return;
                #else
            
                if(AudioLinkIsAvailable()) {
                    half2 alUV = 0;
            
                    half2 globalUv = 0;
            
                    #if defined(GLOBAL_UV_SET)
                    globalUv = GLOBAL_uv;
                    #else
                    globalUv = d.uv0;
                    #endif
            
                    switch (_ALMapUVSet) {
                        case 0: alUV = globalUv; break;
                        case 1: alUV = d.uv1; break;
                        case 2: alUV = d.uv2; break;
                        case 3: alUV = d.uv3; break;
                    }
                    half4 alMask = SAMPLE_TEXTURE2D(_ALMap, sampler_ALMap, alUV);
            
                    #if defined(AL_MODE_SINGLE_CHANNEL)
            
                    half sampledAL = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        sampledAL = AudioLinkData(int2(0, _ALBand)).x;
                    } else {
                        sampledAL = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel, _ALBand)).x;
                    }
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
            
                    #elif defined(AL_MODE_PACKED_MAP)
            
                    half audioDataBass = 0;
                    half audioDataMids = 0;
                    half audioDataHighs = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        audioDataBass = AudioLinkData(ALPASS_AUDIOBASS).x;
                        audioDataMids = AudioLinkData(ALPASS_AUDIOLOWMIDS).x;
                        audioDataHighs = (AudioLinkData(ALPASS_AUDIOHIGHMIDS).x + AudioLinkData(ALPASS_AUDIOTREBLE).x) * 0.5;
                    } else {
                        audioDataBass = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,0)).x;
                        audioDataMids = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,1)).x;
                        audioDataHighs = (AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,2)).x + AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,3)).x) * 0.5;
                    }
            
                    audioDataMids = clamp(audioDataMids, 0, 0.98);
            
                    half tLow = smoothstep((1-audioDataBass), (1-audioDataBass) + 0.01, alMask.r) * alMask.a;
                    half tMid = smoothstep((1-audioDataMids), (1-audioDataMids) + 0.01, alMask.g) * alMask.a;
                    half tHigh = smoothstep((1-audioDataHighs), (1-audioDataHighs) + 0.01, alMask.b) * alMask.a;
            
                    half4 emissionChannelRed = lerp(alMask.r, tLow, _ALGradientOnRed) * _ALPackedRedColor * audioDataBass;
                    half4 emissionChannelGreen = lerp(alMask.g, tMid, _ALGradientOnGreen) * _ALPackedGreenColor * audioDataMids;
                    half4 emissionChannelBlue = lerp(alMask.b, tHigh, _ALGradientOnBlue) * _ALPackedBlueColor * audioDataHighs;
                    half3 em = emissionChannelRed.rgb + emissionChannelGreen.rgb + emissionChannelBlue.rgb;
                    
                    #elif defined(AL_MODE_UV_BASED)
            
                    half2 aluv;
                    aluv = half2(alUV.x * _ALUVWidth, alUV.y);
                    half sampledAL = AudioLinkLerp(aluv).x;
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
                        
                    #else
                    half3 em = 0;
                    #endif
            
                    half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                    NoV = lerp(NoV, 1 - NoV, _ALEmissionDotMaskInvert);
                    NoV = saturate(pow(NoV, _ALEmissionDotMaskSmoothing));
                    o.Emission += lerp(em, em * NoV, _ALEmissionDotMask);
                }
            
                #endif
            }
            

            void ToonEmissionFragment(inout SurfaceData o) {
                #if defined(_EMISSION)
                half3 emission = SAMPLE_TEXTURE2D(_EmissionMap, sampler_MainTex, GLOBAL_uv).rgb;
                emission *= lerp(emission, emission * o.Albedo, _EmissionTintToDiffuse) * _EmissionColor;
                o.Emission += emission;
                #endif
                o.EmissionScaleWithLight = _EmissionScaleWithLight;
                o.EmissionLightThreshold = _EmissionScaleWithLightSensitivity;
            }
            

            void ToonRimLightFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMLIGHT_ON)
                    
                #ifndef USING_DIRECTIONAL_LIGHT
                    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(d.worldSpacePosition));
                #else
                    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
            
                half3 normal = 0;
                #if defined(PIXEL_NORMAL_SET)
                normal = GLOBAL_pixelNormal;
                #else
                normal = o.Normal;
                #endif
            
                half lightNoL = saturate(dot(normal, lightDir));
                half SVDNoN = abs(dot(d.svdn, normal));
            
                half rimIntensity = saturate((1 - SVDNoN)) * saturate(pow(lightNoL, _RimThreshold));
                rimIntensity = smoothstep(_RimRange - _RimSharpness, _RimRange + _RimSharpness, rimIntensity);
                half4 rim = rimIntensity * _RimIntensity;
            
                // Rim Light Env Tint
                half3 env = 0;
                #if defined(UNITY_PASS_FORWARDBASE)
                    env = getEnvReflection(d.worldSpaceViewDir.xyz, d.worldSpacePosition.xyz, normal, o.Smoothness, 5);
                #endif
                    
                o.RimLight = rim * _RimTint * lerp(1, half4(o.Albedo.rgb,1), _RimAlbedoTint) * lerp(1, half4(env.rgb,1), _RimEnvironmentTint);
                o.RimLight *= _RimTint.a;
                o.RimAttenuation = _RimAttenuation;
                    
                #endif
            }
            

            void ToonShadowRimFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMSHADOW_ON)
            
                Light mainLight = GetMainLight(0..xxxx, d.worldSpacePosition, 0..xxxx);
            
                float3 lightDir = mainLight.direction;
                    
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
                half lightNoL = saturate(dot(GLOBAL_pixelNormal, lightDir));
                half SVDNoN = abs(dot(d.svdn, GLOBAL_pixelNormal));
                half shadowRimIntensity = saturate((1 - SVDNoN)) * pow(1 - lightNoL, _ShadowRimThreshold * 2);
                shadowRimIntensity = smoothstep(_ShadowRimRange - _ShadowRimSharpness, _ShadowRimRange + _ShadowRimSharpness, shadowRimIntensity);
            
                o.RimShadow = lerp(1, (_ShadowRimTint * lerp(1, o.Albedo.rgbb, _ShadowRimAlbedoTint)), shadowRimIntensity);
            
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
                #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            bool ShouldReact() { return AudioLinkIsAvailable() && !_ChromaForceIdle; }
            
            float ChronoTime(int band)
            {
                if (ShouldReact()) return AudioLinkGetChronoTime(0, band);
                return _Time.x;
            }
            
            fixed3 ThemeColor(int theme)
            {
                theme %= 4;
                if (ShouldReact() && !_ChromaForceTheme)
                {
                    return AudioLinkData(ALPASS_THEME_COLOR0 + int2(theme, 0));
                } else switch (theme) {
                    case 0:
                        return _ChromaTheme0;
            
                    case 1:
                        return _ChromaTheme1;
            
                    case 2:
                        return _ChromaTheme2;
            
                    case 3:
                        return _ChromaTheme3;
            
                    default:
                        return 0.0;
                }
            }
            
            // float3 ThemeHue(float value)
            // {
            //     float scaledTime = value * 4.0;
            //     return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime));
            // }
            
            fixed3 ChromaEffect(int effect, int band, float progress, float value)
            {
                fixed dft = 0.0;
                if (effect > 8)
                    if (ShouldReact())
                    {
                        dft = AudioLinkLerpMultiline(ALPASS_DFT + float2(progress * AUDIOLINK_ETOTALBINS, 0.0)).g * 0.9;
                    } else
                        dft = (_Time.x * _ChromaSpeed) - progress;
            
                switch (effect)
                {
                    case 1: // Color Theme 1 to Color Theme 2
                        return lerp(ThemeColor(0), ThemeColor(1), progress) * value;
            
                    case 2: // Color Theme 3 to Color Theme 4
                        return lerp(ThemeColor(2), ThemeColor(3), progress) * value;
            
                    case 3: // Color Themes 1 - 4
                        float scaledTime = progress * 3.0;
                        return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime)) * value;
            
                    case 4: // Solid Hue Chronotensity
                        return HSV2RGB(float3(ChronoTime(band) * _ChromaSpeed, 1.0, value));
            
                    case 5: // Hue Value
                        return HSV2RGB(float3(ShouldReact() ? value : (_Time.x + .5 * _ChromaSpeed), 1.0, value));
            
                    case 6: // Hue Time Gradient
                        return HSV2RGB(float3((_Time.x * 2.0 * _ChromaSpeed) - progress, 1.0, value));
            
                    case 7: // Hue Time Gradient + Time Pulse Gradient
                        return HSV2RGB(float3(((_Time.y / 5.0) * _ChromaSpeed) - progress, 1.0, value * abs(sin((_Time.y * _ChromaSpeed) - (progress * 15.0)))));
            
                    case 8: // Hue Chronotensity Gradient
                        return HSV2RGB(float3((((ChronoTime(band) * _ChromaSpeed) + AudioLinkGetChronoTime(4, band)) * 0.33) - progress, 1.0, value));
            
                    case 9: // Waveform Hue
                        return HSV2RGB(float3(dft, 1.0, value));
            
                    case 10: // Warped Waveform Hue
                        return HSV2RGB(float3((sin((dft - progress) * UNITY_PI) + 1.0) / 2.0, 1.0, value));
            
                    default:
                        return 0.0;
                }
            }
            
            void ChromaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_AUDIOLINKCHROMA)
            
                    if (!_EnableAudioLinkChroma) return;
            
                    #if defined(_LUMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (!_ReactPriority) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _ChromaMask);
            
                    fixed4 mask = _ChromaMask.Sample(bilinear_clamp, uv);
                    #if defined(_CHROMAMAP)
                        fixed4 map = _ChromaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
            
                        int band = floor(clamp(mask.a * 4.0, 0.0, 3.99));
                    #else
                        uv = rotate(uv - 0.5, _ChromaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, clamp(uv.x, 0.0, 1.0));
            
                        int band = _ChromaBand;
                    #endif
                    map.a = pow(map.a, _ChromaWarp);
            
                    fixed value = 1.0;
                    if (ShouldReact()) value = AudioLinkLerp(float2(map.a * _ChromaHistory, band)).r;
            
                    fixed3 color = 0.0;
                    color += ChromaEffect(_ChromaModeR, band, map.a, value) * map.r;
                    #if defined(_CHROMAMAP)
                        color += ChromaEffect(_ChromaModeG, band, map.a, value) * map.g;
                        color += ChromaEffect(_ChromaModeB, band, map.a, value) * map.b;
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.114)), _ChromaBiased) * _ChromaTint * mask.rgb;
            
                    o.Emission += color;
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            fixed3 LumaGradient(int grad, fixed prog)
            {
                return AudioLinkLerp(float2(prog * 127.0, LUMA_START - (grad % LUMA_POWER)));
            }
            
            fixed3 LumaLegacyGradient(int grad, fixed prog)
            {
                #if defined(_LUMALEGACY)
                    if (grad < 4)
                    {
                        fixed2 theme = fixed2((grad / 2) * LUMA_LEGACY_THEME_SIZE, -(grad % 2) * LUMA_LEGACY_THEME_SIZE);
                        return _Stored.SampleLevel(bilinear_clamp, (LUMA_LEGACY_THEME_POSITION + theme) / LUMA_LEGACY_SIZE, 0);
                    } else {
                        prog = GRADSTART[grad - 4] + (LUMA_LEGACY_LENGTH * prog);
                        return _Stored.SampleLevel(bilinear_clamp, fixed2(prog, LUMA_LEGACY_Y) / LUMA_LEGACY_SIZE, 0);
                    }
                #endif
            
                return 0.0;
            }
            
            void LumaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_LUMA)
            
                    if (!_EnableLuma) return;
            
                    #if defined(_AUDIOLINKCHROMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (_ReactPriority) return;
                    #endif
            
                    #if defined(_LUMALEGACY)
                        if (!IsLumaAvailable() && !IsLumaLegacyAvailable()) return;
                    #else
                        if (!IsLumaAvailable()) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _LumaMask);
            
                    fixed4 mask = _LumaMask.Sample(bilinear_clamp, uv);
                    #if defined(_LUMAMAP)
                        fixed4 map = _LumaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
                    #else
                        uv = rotate(uv - 0.5, _LumaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, uv.x);
                    #endif
            
                    map.a = pow(map.a, _LumaWarp);
                    fixed3 color = 0.0;
            
                    #if defined(_LUMALEGACY)
                        if (IsLumaAvailable())
                        {
                            color += LumaGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        } else {
                            map.a = 1.0 - map.a;
                            color += LumaLegacyGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaLegacyGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaLegacyGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        }
                    #else
                        color += LumaGradient(_LumaGrad1, map.a) * map.r;
                        #if defined(_LUMAMAP)
                            color += LumaGradient(_LumaGrad2, map.a) * map.g;
                            color += LumaGradient(_LumaGrad3, map.a) * map.b;
                        #endif
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _LumaBiased) * _LumaTint * mask.rgb;
            
                    o.Emission += color;
            
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            void VideoFrag(MeshData d, inout SurfaceData o) {
            
                #if defined(_VIDEO)
                    if (!_EnableVideo) return;
            
                    float2 videouv = TRANSFORM_TEX(d.uv0, _VideoMask);
                    fixed4 video = 0.0;
            
                    #if defined(_VIDEOMAP)
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                        videouv = _VideoMap.SampleLevel(bilinear_clamp, videouv, 0).rg;
                    #else
                        videouv -= 0.5;
                        videouv = rotate(videouv, _VideoRotation);
                        videouv.y *= _VideoRatio;
                        videouv += 0.5;
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                    #endif
            
            
            
                    if (videouv.x > 0.0 && videouv.x < 1.0 && videouv.y > 0.0 && videouv.y < 1.0 && any(mask > 0.01))
                    {
                        if (IsVideoAvailable())
                        {
                            #if defined(_VIDEOAST)
                                videouv = TRANSFORM_TEX(videouv, _Udon_VideoTex);
                            #endif
                            video.rgb = _Udon_VideoTex.SampleLevel(bilinear_clamp, videouv, 0);
                        } else video.rgb = _VideoFallback.SampleLevel(bilinear_clamp, videouv, 0);
            
                        fixed3 videocolor = video.rgb * mask.rgb * _VideoTint.rgb;
                        #if defined(_VIDEOALBEDO)
                            o.Albedo.rgb = lerp(o.Albedo.rgb, videocolor, _VideoTint.a);
                        #else
                            o.Emission += videocolor;
                        #endif
                    }
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            fixed4 SampleCrowdwave(float3 objectPos)
            {
            
                float2 position = mul(unity_ObjectToWorld, float4(objectPos, 1.0)).xz;
            
                float2 worldPosition = _Udon_CrowdwaveMeta._m20_m21_m22_m23.xz;
                float4 screenBounds = _Udon_CrowdwaveMeta._m00_m01_m02_m03;
                float2 worldBounds = _Udon_CrowdwaveMeta._m10_m11_m12_m13.xy;
                fixed worldRotation = _Udon_CrowdwaveMeta._m20_m21_m22_m23.w;
                half intensity = _Udon_CrowdwaveMeta._m10_m11_m12_m13.z;
                //_Udon_CrowdwaveMeta._m10_m11_m12_m13.w;
                //_Udon_CrowdwaveMeta._m30_m31_m32_m33;
            
                intensity = intensity > 1.0 ? intensity - 1.0 : 0.0;
            
                position -= worldPosition;
                position.xy = rotate(position.xy, worldRotation);
                position.xy += worldBounds / 2.0;
                position.xy /= worldBounds;
            
                half mask = _Udon_CrowdwaveMask.SampleLevel(sampler_Udon_CrowdwaveMask, position.xy, 0);
                if (!IsVideoAvailable() || position.x < 0.0 || position.x > 1.0 || position.y < 0.0 || position.y > 1.0) mask = 0.0;
            
                position.xy *= screenBounds.xy;
                position.xy += screenBounds.zw;
            
                fixed3 color = _Udon_VideoTex.SampleLevel(bilinear_clamp, position.xy, 0) * intensity * mask;
            
                return fixed4(color.xyz, mask);
            
            }
                
            void CrowdwaveFrag(MeshData d, inout SurfaceData o)
            {
            
                #if defined(_CROWDWAVE)
                    if (!_EnableCrowdwave) return;
            
                    half3 crowdwaveMask = _CrowdwaveMask.Sample(sampler_CrowdwaveMask, TRANSFORM_TEX(d.uv0, _CrowdwaveMask));
            
                    #if defined(_CROWDWAVERANGE)
                        fixed3 color = SampleCrowdwave(d.localSpacePosition).rgb;
                    #else
                        fixed3 color = SampleCrowdwave(0.0).rgb;
                    #endif
            
                    o.Emission += lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _CrowdwaveBias) * _CrowdwaveTint * crowdwaveMask;
                #endif
            }
            

            void LTCGICustomGI(MeshData d, SurfaceData o, inout half3 indirectSpecular, inout half3 indirectDiffuse)
            {
                #if !defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            o.Normal.xyz,
                            d.worldSpaceViewDir,
                            saturate((1 - o.Smoothness) + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            indirectSpecular += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            indirectSpecular += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        indirectDiffuse += ltcgiData.diffuse * _LTCGIDiffuseIntensity;
                    #endif
                }
                #endif
            }
            

            void LTCGIColor(MeshData d, FragmentData i, inout SurfaceData o, inout half4 FinalColor, bool facing)
            {
                #if defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        #if defined(PASS_OUTLINE)
                        return;
                        #endif
            
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        float3 viewDir = d.worldSpaceViewDir;
                        if (!facing)
                        {
                            viewDir = -d.worldSpaceViewDir;
                        }
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            d.worldNormal.xyz,
                            viewDir,
                            saturate(0.5 + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            FinalColor.rgb += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            FinalColor.rgb += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        half3 rampHSV = RGB2HSV(ltcgiData.diffuse);
                        rampHSV.z = tanh(rampHSV.z);
                        rampHSV.z = SAMPLE_TEXTURE2D(_LTCGIRamp, sampler_LTCGIRamp, half2(rampHSV.z, 0)).r;
                        FinalColor.rgb += HSV2RGB(rampHSV) * o.Albedo * _LTCGIDiffuseIntensity;
                        if (_LTCGIAlphaPremultiply)
                        {
                            FinalColor.rgb *= FinalColor.a;
                        }
                    #endif
                }
                #endif
            }
            

            void Toon_SheenFragment(MeshData d, inout SurfaceData o) {
                half sheenMask = _SheenMask.SampleLevel(sampler_SheenMask, TRANSFORM_TEX(d.uv0, _SheenMask), 0).r;
                if (sheenMask < 0.5) return;
            
                half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                NoV = saturate(pow(NoV, _SheenPower));
                half3 blendSource = lerp(_SheenTint, o.Albedo, _SheenAlbedoTint);
                half3 blended = blendSource;
                switch (_SheenBlendType)
                {
                    case 0: blended = BlendOverlay(o.Albedo, blendSource * NoV); break;
                    case 1: blended = BlendLighten(o.Albedo, blendSource * NoV); break;
                    case 2: blended = BlendScreen(o.Albedo, blendSource * NoV); break;
                    case 3: blended = o.Albedo * blendSource * NoV; break;
                }
                o.Albedo = lerp(o.Albedo, blended, _SheenStrength);
            
            }
            

            void VRCFeaturesVertex(inout VertexData v)
            {
                #if defined(VRC_FEATURES)
                bool isInVRHandCam = _VRChatCameraMode == 1;
                bool isInDesktopHandCam = _VRChatCameraMode == 2;
                bool isInVR = isVR();
                bool isInDesktop = !isInVR && !isInDesktopHandCam;
                bool isInVRMirror = _VRChatMirrorMode == 1;
                bool isInDesktopMirror = _VRChatMirrorMode == 2;
            
                if (_VRCHideInVR && isInVR)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktop && isInDesktop)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRCamera && isInVRHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopCamera && isInDesktopHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRMirror && isInVRMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopMirror && isInDesktopMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                #endif
            }
            

            half4 calcRamp(half NdL, half attenuation, half occlusion, int occlusionMode)
            {
                half remapRamp;
                remapRamp = NdL * 0.5 + 0.5;
                remapRamp *= lerp(1, occlusion, occlusionMode);
                #if defined(UNITY_PASS_FORWARDBASE)
                remapRamp *= attenuation;
                #endif
                half4 ramp = SAMPLE_TEXTURE2D(_Ramp, sampler_Ramp, half2(remapRamp, 0));
                return ramp;
            }
            
            half3 calcIndirectSpecular(half lightAttenuation, MeshData d, SurfaceData o, half roughness, half3 reflDir, half3 indirectLight, float3 fresnel, half4 ramp)
            {
                half3 spec = half3(0,0,0);
            
                #if defined(REFLECTION_MODE_OFF)
                return spec;
                #endif
            
                #if defined(REFLECTION_MODE_MATCAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    spec = o.BakedReflection;
                    if(o.ReflectionBlendMode != 1)
                    {
                        spec *= (indirectLight + (_LightColor0 * lightAttenuation) * 0.5);
                    }
                }
                #endif
            
                #if defined(REFLECTION_MODE_PBR) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 reflectionUV1 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
            
                    half3 indirectSpecular;
                    half interpolator = unity_SpecCube0_BoxMin.w;
            
                    UNITY_BRANCH
                    if (interpolator < 0.99999)
                    {
                        half3 reflectionUV2 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                        half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                        indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
                    }
                    else
                    {
                        indirectSpecular = probe0sample;
                    }
            
                    if (!any(indirectSpecular))
                    {
                        indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        indirectSpecular *= indirectLight;
                    }
                    spec = indirectSpecular * fresnel;
                }
                #endif
            
                #if defined(REFLECTION_MODE_BAKED_CUBEMAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    indirectSpecular *= indirectLight;
                    spec = indirectSpecular * fresnel;
                }
                #endif
                return spec;
            }
            
            half3 calcDirectSpecular(MeshData d, SurfaceData o, float lightNoL, float NoH, float NoV, float lightLoH, half3 lightColor, half3 lightHalfVector, half anisotropy)
            {
                half specularIntensity = o.SpecularIntensity;
                half3 specular = half3(0,0,0);
                half smoothness = max(0.01, (o.SpecularArea));
                smoothness *= 1.7 - 0.7 * smoothness;
            
                float rough = max(smoothness * smoothness, 0.0045);
                float Dn = D_GGX(NoH, rough);
                float3 F = 1-F_Schlick(lightLoH, 0);
                float V = V_SmithGGXCorrelated(NoV, lightNoL, rough);
                float3 directSpecularNonAniso = max(0, (Dn * V) * F);
            
                anisotropy *= saturate(5.0 * smoothness);
                float at = max(rough * (1.0 + anisotropy), 0.001);
                float ab = max(rough * (1.0 - anisotropy), 0.001);
                float D = D_GGX_Anisotropic(NoH, lightHalfVector, d.worldSpaceTangent, d.bitangent, at, ab);
                float3 directSpecularAniso = max(0, (D * V) * F);
            
                specular = lerp(directSpecularNonAniso, directSpecularAniso, saturate(abs(anisotropy * 100)));
                specular = lerp(specular, smoothstep(0.5, 0.51, specular), o.SpecularSharpness) * 3 * lightColor.xyz * specularIntensity; // Multiply by 3 to bring up to brightness of standard
                specular *= lerp(1, o.Albedo, o.SpecularAlbedoTint);
                specular = clamp(specular, 0, specularIntensity);
                return specular;
            }
            
            half3 calcReflectionBlending(SurfaceData o, half reflectivity, half3 col, half3 indirectSpecular)
            {
                half3 reflection = indirectSpecular.xyzz * reflectivity;
            
                // Doing a Lerp allows shaders to smoothly transition between blend modes
                col = lerp(
                    col + reflection, // Additive
                    lerp(
                        lerp(col, col * indirectSpecular.xyz, reflectivity), // Multiplicitive
                        col - reflection, // Subtractive
                        saturate(o.ReflectionBlendMode - 1)
                    ),
                    saturate(o.ReflectionBlendMode)
                );
                return col;
            }
            
            half4 calcEmission(SurfaceData o, half lightAvg)
            {
                #if defined(UNITY_PASS_FORWARDBASE) // Emission only in Base Pass, and vertex lights
                    float4 emission = 0;
                    emission = half4(o.Emission, 1);
            
                    half intensity = length(emission.rgb);
                    half3 emissionHSV = RGB2HSV(normalize(emission.rgb));
                    emissionHSV.x = fmod(emissionHSV.x + o.Hue, 1);
                    emissionHSV.y = saturate(emissionHSV.y + o.Saturation);
                    emissionHSV.z = saturate(emissionHSV.z + o.Value);
                    emission.rgb = HSV2RGB(emissionHSV) * intensity;
            
                    float4 scaledEmission = emission * saturate(smoothstep(1 - o.EmissionLightThreshold, 1 + o.EmissionLightThreshold, 1 - lightAvg));
                    float4 em = lerp(emission, scaledEmission, o.EmissionScaleWithLight);
                    return em;
                #else
                    return 0;
                #endif
            }
            
            void XSToonLighting(MeshData d, FragmentData i, SurfaceData o, inout half4 FinalColor)
            {
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half reflectance = o.Reflectivity;
                float oneMinusReflectivity = 1.0 - 0.04 - o.Metallic * (1.0 - 0.04);
                half3 f0 = 0.16 * reflectance * reflectance * (1 - o.Metallic) + o.Albedo * o.Metallic;
                half3 indirectDiffuse = 1;
                half3 indirectSpecular = 0;
                half3 directSpecular = 0;
                half occlusion = o.Occlusion;
                half perceptualRoughness = 1 - o.Smoothness;
                half3 tangentNormal = o.Normal;
                o.Normal = normalize(mul(o.Normal, d.TBNMatrix));
                half3 reflDir = calcReflView(d.worldSpaceViewDir, o.Normal);
            
                // Light Direction, based on method derived by Xiexe and Merlin
                #ifndef USING_DIRECTIONAL_LIGHT
                    half3 lightDir = UnityWorldSpaceLightDir(d.worldSpacePosition);
                #else
                    half3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
            
                half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                lightDir = (lightDir + probeLightDir);
            
                #if !defined(POINT) && !defined(SPOT)
                if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
                {
                    lightDir = half4(1, 1, 1, 0);
                }
                #endif
                lightDir = Unity_SafeNormalize(lightDir);
            
                // Attenuation
                UNITY_LIGHT_ATTENUATION(lightAttenuation, i, d.worldSpacePosition);
            
                // fix for rare bug where light atten is 0 when there is no directional light in the scene
                #ifdef UNITY_PASS_FORWARDBASE
                    if(all(_LightColor0.rgb == 0.0))
                        lightAttenuation = 1.0;
                #endif
            
                #if defined(USING_DIRECTIONAL_LIGHT)
                    half sharp = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, lightAttenuation); //Converge at the center line
                #endif
            
                half3 lightColor = _LightColor0.rgb;
            
                half3 lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                half lightNoL = dot(o.Normal, lightDir);
                half lightLoH = dot(lightDir, lightHalfVector);
            
                half NoV = abs(dot(o.Normal, d.worldSpaceViewDir)) + 1e-5;
                half NoH = saturate(dot(o.Normal, lightHalfVector));
                half3 stereoViewDir = calcStereoViewDir(d.worldSpacePosition);
                half NoSVDN = abs(dot(stereoViewDir, o.Normal));
            
                // Aniso Refl
                half3 reflViewAniso = 0;
            
                float3 anisotropicDirection = o.Anisotropy >= 0.0 ? d.bitangent : d.worldSpaceTangent.xyz;
                float3 anisotropicTangent = cross(anisotropicDirection, d.worldSpaceViewDir);
                float3 anisotropicNormal = cross(anisotropicTangent, anisotropicDirection);
                float bendFactor = abs(o.Anisotropy) * saturate(5.0 * perceptualRoughness);
                float3 bentNormal = normalize(lerp(o.Normal, anisotropicNormal, bendFactor));
                reflViewAniso = reflect(-d.worldSpaceViewDir, bentNormal);
            
                // Indirect diffuse
                #if !defined(LIGHTMAP_ON)
                    half3 L0 = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
                    indirectDiffuse.r = shEvaluateDiffuseL1Geomerics(L0.r, unity_SHAr.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.g = shEvaluateDiffuseL1Geomerics(L0.g, unity_SHAg.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.b = shEvaluateDiffuseL1Geomerics(L0.b, unity_SHAb.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse = max(0, indirectDiffuse);
                #elif defined(UNITY_PASS_FORWARDBASE)
                    // This here is an attempt to provide a somewhat usable ramp for lightmaps
                    half2 lightmapUV = d.lightmapUv.xy;
                    half4 bakedColorTex = 0;
                    half3 lightMap = tex2DFastBicubicLightmap(lightmapUV, bakedColorTex);
            
                    // Support basic directionality
                    #if defined(DIRLIGHTMAP_COMBINED)
                        half4 lightMapDirection = tex2DFastBicubicSample(unity_LightmapInd, samplerunity_Lightmap, lightmapUV);
            
                        // use lightmap direction if we can, realtim light is ignored in that case
                        lightDir.xyz = lightMapDirection.xyz - 0.5;
                        lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                        lightNoL = dot(o.Normal, lightDir);
                        lightLoH = dot(lightDir, lightHalfVector);
            
                        lightMap = DecodeDirectionalLightmap(lightMap, lightMapDirection, o.Normal);
            
                        lightColor = lightMap * 0.6;
                        indirectDiffuse = lightMap * 0.4;
                    #else
                        // Hacky way to support both cases of dirlight + baked and bakedy only but no directionality
                        // baked generates a light dir of 0,1,0
                        if (dot(lightDir.xyz, half3(0,1,0)) > 0.95) {
                            lightDir.xyz = 0;
                            lightNoL = 1;
                        }
                        indirectDiffuse = lightMap;
                    #endif
            
                    // we can end up using this twice, once above in the Dirlight logic and once here if both a realtime light
                    // and baked lightmap are present
                    half sharp2 = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, saturate(length(lightMap)));
                #endif
                indirectDiffuse *= lerp(occlusion, 1, o.OcclusionMode);
            
                if (_MonochromeLighting > 0)
                {
                    indirectDiffuse = lerp(indirectDiffuse, dot(indirectDiffuse, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
            
                bool lightEnv = any(lightDir.xyz);
                // if there is no realtime light - we rely solely on probes
                if (!lightEnv) {
                    lightColor = indirectDiffuse * 0.6;
                    indirectDiffuse = indirectDiffuse * 0.4;
                }
            
                #if defined(UNITY_PASS_FORWARDBASE)
                indirectDiffuse = lerp(indirectDiffuse, max(indirectDiffuse, 0.05), _MinLight);
                #endif
            
                half lightAvg = (dot(indirectDiffuse.rgb, grayscaleVec) + dot(lightColor.rgb, grayscaleVec)) / 2;
            
                // Light Ramp
                half4 ramp = 1;
                half4 diffuse = 1;
                ramp = calcRamp(lightNoL, lightAttenuation, occlusion, o.OcclusionMode);
                // Begin Added
                if (_MonochromeLighting > 0)
                {
                    lightColor = lerp(lightColor, dot(lightColor, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
                // End Added
                diffuse = calcDiffuse(lightAttenuation, o.Albedo.rgb, indirectDiffuse, lightColor, ramp);
            
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                float4 vLightAttenuations = 0;
                float4x4 vLightColors = getVertexLightsColors(d.worldSpacePosition, o.Normal, vLightAttenuations, false);
                float4x4 vLightDirections = getVertexLightsDir(d.worldSpacePosition);
                float4x4 vLightHalfVectors = 0;
                float4 vLightNoLs = 0;
                float4 vLightLoHs = 0;
                half4 vRamp = 1;
            
                [unroll(4)]
                for (int i = 0; i < 4; i++)
                {
                    vLightHalfVectors[i].rgb = Unity_SafeNormalize(vLightDirections[i] + d.worldSpaceViewDir);
                    vLightLoHs[i] = saturate(dot(vLightDirections[i], vLightHalfVectors[i]));
                    vLightNoLs[i] = saturate(dot(o.Normal, vLightDirections[i]));
                    vRamp = calcRamp(vLightNoLs[i], vLightAttenuations[i], occlusion, o.OcclusionMode);
                    diffuse += calcDiffuse(vLightAttenuations[i], o.Albedo.rgb, 0, vLightColors[i], vRamp);
                }
                #endif
            
                // Rims
                half3 rimLight = 0;
                #if defined(RIMLIGHT_ON)
                rimLight = o.RimLight.rgb;
                rimLight *= lightColor.xyz + indirectDiffuse.xyz;
                rimLight *= lerp(1, lightAttenuation + indirectDiffuse.xyz, o.RimAttenuation);
                #endif
            
                half3 rimShadow = 1;
                #if defined(RIMSHADOW_ON)
                rimShadow = o.RimShadow;
                #endif
            
                float3 fresnel = F_Schlick(NoV, f0);
            
                #if !defined(REFLECTION_MODE_OFF)
                indirectSpecular = calcIndirectSpecular(lightAttenuation, d, o, perceptualRoughness, reflViewAniso, indirectDiffuse, fresnel, ramp) * occlusion;
                #endif
            
                #if defined(SPECULAR_ON)
                directSpecular = calcDirectSpecular(d, o, lightNoL, NoH, NoV, lightLoH, lightColor, lightHalfVector, o.SpecularAnisotropy) * lightNoL * occlusion * lightAttenuation;
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                {
                    [unroll(4)]
                    for (int i = 0; i < 4; i++)
                    {
                        directSpecular += calcDirectSpecular(d, o, vLightNoLs[i], vLightLoHs[i], NoV, vLightLoHs[i], vLightColors[i], vLightHalfVectors[i], o.SpecularAnisotropy) * vLightNoLs[i] * occlusion * vLightAttenuations[i];
                    }
                }
                #endif
                #endif
            
                // Standard-Like transparent (premult alpha)
                if (_RenderType == 2)
                {
                    diffuse.rgb *= o.Alpha;
                    o.Alpha = 1 - (oneMinusReflectivity) + o.Alpha * (oneMinusReflectivity);
                }
            
                #if !defined(_NATIVE_A2C)
                {
                    // Standard-Like cutout
                    if (_RenderType == 1)
                    {
                        clip(o.Alpha - _Cutoff);
                    }
                }
                #endif
            
                FinalColor.rgb = diffuse.rgb * rimShadow.rgb;
            
                #if !defined(REFLECTION_MODE_OFF)
                FinalColor.rgb = calcReflectionBlending(o, reflectance, FinalColor.rgb, indirectSpecular);
                #endif
            
                FinalColor.rgb += max(directSpecular.xyz, rimLight.rgb).rgb;
                FinalColor.rgb += calcEmission(o, lightAvg);
            
                // Outline
                #if defined(PASS_OUTLINE)
                    half3 outlineColor = 0;
                    half3 ol = o.OutlineColor;
                    outlineColor = ol * saturate(lightAttenuation * lightNoL) * lightColor.rgb;
                    outlineColor += indirectDiffuse * ol;
                    outlineColor = lerp(outlineColor, ol, o.OutlineLightingMode);
                    FinalColor.rgb = outlineColor;
                #endif
            
                FinalColor.a = o.Alpha;
            
                // Premulty output by alpha for correct `Fade` mode
                #if defined(UNITY_PASS_FORWARDADD)
                if (_RenderType == 3)
                {
                    FinalColor.rgb *= o.Alpha;
                }
                #endif
            
                #endif
            }
            

            void VertexBase(inout VertexData v, inout FragmentData o)
            {
                #if defined(UNITY_PASS_META) && !defined(UNITY_PASS_BAKERY_META)
                o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
                #else
                o.pos = TransformObjectToHClip(v.vertex);
                #endif
                o.normal = v.normal;
                o.uv0 = v.uv0;
                o.uv1 = v.uv1;
                o.uv2 = v.uv2;
                o.uv3 = v.uv3;
                #if defined(NEED_UV4)
                o.uv4 = v.uv4;
                #endif
                #if defined(NEED_UV5)
                o.uv5 = v.uv5;
                #endif
                #if defined(NEED_UV6)
                o.uv6 = v.uv6;
                #endif
                #if defined(NEED_UV7)
                o.uv7 = v.uv7;
                #endif
                o.worldPos = mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1));
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldTangent.xyz = UnityObjectToWorldDir(v.tangent.xyz);
                o.worldTangent.w = v.tangent.w * unity_WorldTransformParams.w;
                o.vertexColor = v.color;
            
                #if defined(EDITOR_VISUALIZATION)
                o.vizUV = 0;
                o.lightCoord = 0;
                if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
                {
                    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.uv0.xy, v.uv1.xy, v.uv2.xy, unity_EditorViz_Texture_ST);
                }
                else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
                {
                    o.vizUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
                }
                #endif
            
                #if defined(NEED_SCREEN_POS)
                o.screenPos = GetScreenPosition(o.pos);
                o.screenPos.z = -TransformWorldToView(TransformObjectToWorld(v.vertex)).z;
                #endif
            
                #if !defined(UNITY_PASS_META)
                    #if defined(LIGHTMAP_ON)
                    o.lightmapUv.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    #endif
                    #if defined(DYNAMICLIGHTMAP_ON)
                    o.lightmapUv.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                    #endif
                        
                    UNITY_TRANSFER_LIGHTING(o, v.uv1.xy);
                    
                    #if !defined(UNITY_PASS_FORWARDADD)
                        // unity does some funky stuff for different platforms with these macros
                        #ifdef FOG_COMBINED_WITH_TSPACE
                            UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o, o.pos);
                        #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                            UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o, o.pos);
                        #else
                            UNITY_TRANSFER_FOG(o, o.pos);
                        #endif
                    #else
                        UNITY_TRANSFER_FOG(o, o.pos);
                    #endif
                #endif
            }
            

            // Free Functions

            // ForwardBase Vertex
            #if !defined(TESS_ENABLED)
            FragmentData Vertex(VertexData v)
            {
                UNITY_SETUP_INSTANCE_ID(v);
                FragmentData o;
                UNITY_INITIALIZE_OUTPUT(FragmentData, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // ForwardBase Vertex Chain
                VRCFeaturesVertex(v);

                ToonOutlineVertex(v);

                AudioLinkVertex(v);

                // ForwardBase VertexBase
                VertexBase(v, o);

                // ForwardBase PostVertex Chain

                return o;
            }
            #endif

            // ForwardBase Fragment
            half4 Fragment(FragmentData i, bool facing: SV_IsFrontFace) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(i);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
                #ifdef FOG_COMBINED_WITH_TSPACE
                    UNITY_EXTRACT_FOG_FROM_TSPACE(i);
                #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                    UNITY_EXTRACT_FOG_FROM_WORLD_POS(i);
                #else
                    UNITY_EXTRACT_FOG(i);
                #endif

                SurfaceData o = CreateSurfaceData();
                MeshData d = CreateMeshData(i, facing);
                half4 FinalColor = 1;

                // ForwardBase Fragment Chain
                ToonMainFragment(d, o, facing);

                ToonOcclusionFragment(d, o);

                ToonNormalsFragment(d, o);

                ToonOutlineFragment(d, o);

                ToonSpecularFragment(d, o);

                ToonReflectionFragment(d, o);

                ToonALFragment(d, o);

                ToonEmissionFragment(o);

                ToonRimLightFragment(d, o);

                ToonShadowRimFragment(d, o);

                ChromaFrag(d, o);

                LumaFrag(d, o);

                VideoFrag(d, o);

                CrowdwaveFrag(d, o);

                Toon_SheenFragment(d, o);

                // ForwardBase FragmentBase
                XSToonLighting(d, i, o, FinalColor);

                UNITY_APPLY_FOG(_unity_fogCoord, FinalColor);
                
                // ForwardBase Color Chain
                LTCGIColor(d, i, o, FinalColor, facing);

                return FinalColor;
            }

            ENDCG
            // ForwardBase Pass End
        }

        Pass
        {
            Tags { "LightMode" = "ForwardAdd"  }
            ZWrite Off
            Blend SrcAlpha One, Zero One

            // ForwardAdd Pass Start
            CGPROGRAM
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdadd_fullshadows
            #pragma multi_compile_fog
            #pragma vertex Vertex
            #pragma fragment Fragment
            #pragma shader_feature_local_fragment _NATIVE_A2C
            
            #pragma shader_feature_local_fragment SEPARATE_ALPHA
            
            #pragma shader_feature _AUDIOLINKVERTEX
            
            #pragma shader_feature_local_fragment NORMALS_SET
            #pragma shader_feature_local_fragment DETAIL_NORMALS_SET
            
            #pragma shader_feature_local OUTLINE_ENABLED
            
            #pragma shader_feature_local_fragment SPECULAR_ON
            
            #pragma shader_feature_local_fragment REFLECTION_MODE_OFF REFLECTION_MODE_PBR REFLECTION_MODE_BAKED_CUBEMAP REFLECTION_MODE_MATCAP
            
            #pragma shader_feature_local_fragment AL_MODE_SINGLE_CHANNEL AL_MODE_PACKED_MAP AL_MODE_UV_BASED
            #if !defined(AL_MODE_SINGLE_CHANNEL) && !defined(AL_MODE_PACKED_MAP) && !defined(AL_MODE_UV_BASED)
                #define AL_MODE_NONE
            #endif
            
            #pragma shader_feature_local_fragment _EMISSION
            
            #pragma shader_feature_local_fragment RIMLIGHT_ON
            
            #pragma shader_feature_local_fragment RIMSHADOW_ON
            
            #pragma shader_feature _AUDIOLINKCHROMA
            #pragma shader_feature _CHROMAMAP
            
            #pragma shader_feature _LUMA
            #pragma shader_feature _LUMALEGACY
            #pragma shader_feature _LUMAMAP
            
            #pragma shader_feature _VIDEO
            #pragma shader_feature _VIDEOMAP
            #pragma shader_feature _VIDEOAST
            #pragma shader_feature _VIDEOALBEDO
            
            #pragma shader_feature _CROWDWAVE
            #pragma shader_feature _CROWDWAVERANGE
            
            #pragma shader_feature_local_fragment INTEGRATE_LTCGI
            
            #pragma shader_feature_local_vertex VRC_FEATURES
            
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_INSTANCED_LOD_FADE
            #define UNITY_INSTANCED_SH
            #define UNITY_INSTANCED_LIGHTMAPSTS

            #ifndef UNITY_PASS_FORWARDADD
                #define UNITY_PASS_FORWARDADD
            #endif

            // ShaderDefines
            #define NEED_FRAGMENT_IN_SHADOW
            #define NEED_ALBEDO_ALPHA
            
            #define GLOBAL_UV_SET
            
            #define PIXEL_NORMAL_SET
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #if defined(INTEGRATE_LTCGI)
                #define _INTEGRATE_CUSTOMGI_FLEX
            #endif
            
            #define INCLUDE_LTCGI defined(INTEGRATE_LTCGI)
            
            #if INCLUDE_LTCGI
                #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI_structs.cginc"
            #endif
            
            #define ORL_LIGHTING_MODEL_TOON
            
            #if defined(UNITY_PBS_USE_BRDF2) || defined(SHADER_API_MOBILE)
                #define PLAT_QUEST
            #else
                #ifdef PLAT_QUEST
                    #undef PLAT_QUEST
                #endif
            #endif
            
            #define NEED_SCREEN_POS
            
            #define grayscaleVec float3(0.2125, 0.7154, 0.0721)
            // DataStructs
            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 color : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD7;
                #endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct FragmentData
            {
                #if defined(UNITY_PASS_SHADOWCASTER)
                V2F_SHADOW_CASTER;
                #else
                float4 pos : SV_POSITION;
                #endif
                    
                float3 normal : RAW_NORMAL;
                float4 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 uv2 : TEXCOORD3;
                float4 uv3 : TEXCOORD4;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD5;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD6;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD7;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD8;
                #endif
                float3 worldPos : WORLD_POS;
                float3 worldNormal : WORLD_NORMAL;
                float4 worldTangent : WORLD_TANGENT;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                float4 lightmapUv : LM_UV;
                #endif
                centroid float4 vertexColor : VERTEX_COLOR;
            
                #if !defined(UNITY_PASS_META)
                UNITY_LIGHTING_COORDS(9, 10)
                UNITY_FOG_COORDS(11)
                #endif
            
                #if defined(EDITOR_VISUALIZATION)
                float2 vizUV : VIZ_UV;
                float4 lightCoord : LIGHT_COORD;
                #endif
                  
                #if defined(NEED_SCREEN_POS)
                float4 screenPos: SCREENPOS;
                #endif
            
                #if defined(EXTRA_V2F_0)
                float4 extraV2F0 : EXTRA_V2F_BLOCK0;
                #endif
                #if defined(EXTRA_V2F_1)
                float4 extraV2F1 : EXTRA_V2F_BLOCK1;
                #endif
                #if defined(EXTRA_V2F_2)
                float4 extraV2F2 : EXTRA_V2F_BLOCK2;
                #endif
                #if defined(EXTRA_V2F_3)
                float4 extraV2F3 : EXTRA_V2F_BLOCK3;
                #endif
            
                // Additional Fragment Data
                
                // Additional Fragment Data End
            
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            struct LTCGIAccumulatorStruct {
                float3 diffuse;
                float3 specular;
            };
            
            #define LTCGI_V2_CUSTOM_INPUT LTCGIAccumulatorStruct
            
            struct MeshData
            {
                float4 uv0;
                float4 uv1;
                float4 uv2;
                float4 uv3;
                #if defined(NEED_UV4)
                float4 uv4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half4 lightmapUv;
                #endif
                half4 vertexColor;
                half3 normal;
                half3 worldNormal;
                half3 localSpacePosition;
                half3 worldSpacePosition;
                half3 worldSpaceViewDir;
                half3 worldSpaceTangent;
                half3 tangentSpaceViewDir;
                float3x3 TBNMatrix;
                half3 bitangent;
                half3 svdn;
                float4 extraV2F0;
                float4 extraV2F1;
                float4 extraV2F2;
                float4 extraV2F3;
                float4 screenPos;
            
                // Additional Mesh Data
                
                // Additional Mesh Data End
            };
            
            MeshData CreateMeshData(FragmentData i, bool facing)
            {
                MeshData d = (MeshData) 0;
                d.uv0 = i.uv0;
                d.uv1 = i.uv1;
                d.uv2 = i.uv2;
                d.uv3 = i.uv3;
                #if defined(NEED_UV4)
                d.uv4 = i.uv4;
                #endif
                #if defined(NEED_UV5)
                d.uv5 = i.uv5;
                #endif
                #if defined(NEED_UV6)
                d.uv6 = i.uv6;
                #endif
                #if defined(NEED_UV7)
                d.uv7 = i.uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.lightmapUv = i.lightmapUv;
                #endif
                d.worldNormal = normalize(i.worldNormal);
                d.localSpacePosition = mul(unity_WorldToObject, float4(i.worldPos, 1)).xyz;
                d.worldSpacePosition = i.worldPos;
                d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
            
                d.normal = i.normal;
                d.vertexColor = i.vertexColor;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.bitangent = normalize(cross(i.worldTangent.xyz, d.worldNormal) * i.worldTangent.w * - 1);
                d.worldSpaceTangent = normalize(i.worldTangent.xyz);
                d.TBNMatrix = float3x3(normalize(i.worldTangent.xyz), d.bitangent, d.worldNormal);
                d.TBNMatrix[2].xyz *= facing ? 1 : -1;
                d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
                #endif
            
                #if UNITY_SINGLE_PASS_STEREO
                half3 stereoCameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
                d.svdn = normalize(stereoCameraPos - d.worldSpacePosition);
                #else
                d.svdn = d.worldSpaceViewDir;
                #endif
            
                #if defined(EXTRA_V2F_0)
                d.extraV2F0 = i.extraV2F0;
                #endif
                #if defined(EXTRA_V2F_1)
                d.extraV2F1 = i.extraV2F1;
                #endif
                #if defined(EXTRA_V2F_2)
                d.extraV2F2 = i.extraV2F2;
                #endif
                #if defined(EXTRA_V2F_3)
                d.extraV2F3 = i.extraV2F3;
                #endif
                #if defined(NEED_SCREEN_POS)
                d.screenPos = i.screenPos;
                #endif
            
                // Additional Mesh Data Creator
                
                // Additional Mesh Data Creator End
            
                return d;
            }
            
            struct SurfaceData
            {
                half3 Albedo;
                half Alpha;
                half Hue;
                half Saturation;
                half Value;
                    
                half Metallic;
                half Smoothness;
                half Anisotropy;
                half3 Normal;
                    
                half Occlusion;
                int OcclusionMode;
            
                half3 Emission;
                int EmissionScaleWithLight;
                half EmissionLightThreshold;
                    
                half ShadowSharpness;
                    
                half4 RimLight;
                half RimAttenuation;
                half4 RimShadow;
                    
                half SpecularIntensity;
                half SpecularArea;
                half SpecularAlbedoTint;
                half SpecularAnisotropy;
                half SpecularSharpness;
                    
                half Reflectivity;
                half3 BakedReflection;
                half ReflectionBlendMode;
                    
                half3 OutlineColor;
                int OutlineLightingMode;
            
                // Additional Surface Data
                
                // Additional Surface Data End
            };
            
            SurfaceData CreateSurfaceData()
            {
                SurfaceData o = (SurfaceData) 0;
                o.Albedo = 0.5;
                o.Occlusion = 1;
                o.Normal = half3(0, 0, 1);
                o.Smoothness = 0.5;
                o.Alpha = 1;
                o.RimShadow = 1;
                o.RimAttenuation = 1;
                return o;
            }
            // GlobalVariables

            // Variables
            float4 _MainTex_ST;
            int _MainTexUVSet;
            int _TintByVertexColor;
            half4 _Color;
            half4 _BackfaceColor;
            half _BackfaceAlbedoTint;
            half _AlphaScale;
            half _Hue;
            half _Saturation;
            half _Value;
            half _ShadowSharpness;
            half2 GLOBAL_uv;
            int _OcclusionMode;
            half _OcclusionStrength;
            int _OcclusionTilingMode;
            half _OcclusionTiling;
            int _OcclusionDetailEnabled;
            half _OcclusionDetailStrength;
            int _OcclusionDetailTilingMode;
            half _OcclusionDetailTiling;
            #if defined(_AUDIOLINKVERTEX)
                uniform int _EnableAudioLinkVertex;
            #endif
            uniform fixed4 _AudioLinkVertexMap_ST;
            uniform half _AudioLinkVertexHistory;
            uniform int _AudioLinkVertexBand;
            uniform half _AudioLinkVertexIntensity;
            int _BumpMapTilingMode;
            float _BumpMapTiling;
            half _BumpScale;
            int _FlipBumpY;
            int _NormalBicubicSampling;
            half4 _DetailNormalMap_ST;
            int _DetailNormalsUVSet;
            half _DetailNormalTiling;
            half _DetailNormalScale;
            half _FlipDetailNormalY;
            int _DetailNormalMaskUVSet;
            half _DetailNormalMaskTiling;
            half3 GLOBAL_pixelNormal;
            int _StencilBasePass;
            int _StencilBaseComp;
            int _StencilOutlineComp;
            half4 _OutlineColor;
            int _OutlineLightingMode;
            half _OutlineAlbedoTint;
            half4 _OutlineMask_ST;
            half _OutlineWidth;
            int _OutlineWidthAdjustByVertexColor;
            int _SpecularMapUVSet;
            int _SpecularTilingMode;
            half _SpecularTiling;
            half _SpecularIntensity;
            half _SpecularRoughness;
            half _SpecularSharpness;
            half _SpecularAnisotropy;
            half _SpecularAlbedoTint;
            int _SpecularMaskTilingMode;
            half _SpecularMaskTiling;
            half _SpecularMaskStrength;
            int _ReflectionMode;
            half _ReflectionBlendMode;
            half _Smoothness;
            half _Metallic;
            int _RoughnessMode;
            int _MetallicGlossMapTilingMode;
            half _MetallicGlossMapTiling;
            half4 _MetallicRemap;
            half4 _SmoothnessRemap;
            half4 _MetallicGlossMap_TexelSize;
            half _ReflectionAnisotropy;
            half _MatcapBlur;
            half _MatcapTintToDiffuse;
            int _ReflectivityMaskTilingMode;
            half _ReflectivityMaskTiling;
            half _ReflectivityLevel;
            int _ALBand;
            half4 _ALEmissionColor;
            int _ALEmissionDotMask;
            int _ALEmissionDotMaskInvert;
            half _ALEmissionDotMaskSmoothing;
            int _ALGradientOnRed;
            int _ALGradientOnGreen;
            int _ALGradientOnBlue;
            half4 _ALPackedRedColor;
            half4 _ALPackedGreenColor;
            half4 _ALPackedBlueColor;
            int _ALSmoothingLevel;
            int _ALUVWidth;
            int _ALMapUVSet;
            half4 _EmissionColor;
            half _EmissionTintToDiffuse;
            int _EmissionScaleWithLight;
            half _EmissionScaleWithLightSensitivity;
            half4 _RimTint;
            half _RimIntensity;
            half _RimAlbedoTint;
            half _RimEnvironmentTint;
            half _RimAttenuation;
            half _RimRange;
            half _RimThreshold;
            half _RimSharpness;
            half4 _ShadowRimTint;
            half _ShadowRimRange;
            half _ShadowRimThreshold;
            half _ShadowRimSharpness;
            half _ShadowRimAlbedoTint;
            #if defined(_AUDIOLINKCHROMA)
                uniform int _EnableAudioLinkChroma;
            #endif
            uniform float4 _ChromaMask_ST;
            uniform fixed4 _ChromaTint;
            uniform int _ChromaForceIdle;
            uniform int _ChromaModeR;
            uniform int _ChromaModeG;
            uniform int _ChromaModeB;
            uniform fixed _ChromaHistory;
            uniform half _ChromaWarp;
            uniform half _ChromaSpeed;
            uniform half _ChromaBiased;
            uniform int _ChromaForceTheme;
            uniform fixed4 _ChromaTheme0;
            uniform fixed4 _ChromaTheme1;
            uniform fixed4 _ChromaTheme2;
            uniform fixed4 _ChromaTheme3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
                uniform int _ReactPriority;
            #endif
            #if !defined(_CHROMAMAP)
                uniform int _ChromaBand;
                uniform fixed _ChromaRotation;
            #endif
            #if defined(_LUMA)
                uniform int _EnableLuma;
            #endif
            #if defined(_LUMALEGACY)
                uniform fixed4 _Stored_TexelSize;
                const static int GRADSTART[3] = { LUMA_LEGACY_GRAD_START1, LUMA_LEGACY_GRAD_START2, LUMA_LEGACY_GRAD_START3 };
            #endif
            uniform float4 _LumaMask_ST;
            uniform fixed4 _LumaTint;
            uniform half _LumaWarp;
            uniform half _LumaBiased;
            uniform int _LumaGrad1;
            uniform int _LumaGrad2;
            uniform int _LumaGrad3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
            #endif
            #if !defined(_LUMAMAP)
                uniform fixed _LumaRotation;
            #endif
            #if defined(_VIDEO)
                uniform int _EnableVideo;
            #endif
            #ifndef _UDON_VIDEOTEX_ST
                #define _UDON_VIDEOTEX_ST
                uniform float4 _Udon_VideoTex_ST;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
                uniform float4 _Udon_VideoTex_TexelSize;
            #endif
            uniform fixed4 _VideoTint;
            uniform float4 _VideoMask_ST;
            #if !defined(_VIDEOMAP)
                uniform fixed _VideoRatio;
                uniform fixed _VideoRotation;
            #endif
            #if defined(_CROWDWAVE)
                uniform int _EnableCrowdwave;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
            #endif
            uniform fixed4 _CrowdwaveTint;
            uniform half _CrowdwaveBias;
            uniform float4 _CrowdwaveMask_ST;
            uniform float4x4 _Udon_CrowdwaveMeta;
            int _LTCGIEnableOnMobile;
            int _LTCGIClampBrightness;
            half _LTCGIMaxBrightness;
            half _LTCGIDiffuseIntensity;
            half _LTCGISpecularIntensity;
            half _LTCGIRoughnessModifier;
            int _LTCGIAlphaPremultiply;
            half _SheenStrength;
            half _SheenPower;
            half4 _SheenTint;
            half _SheenAlbedoTint;
            int _SheenBlendType;
            half4 _SheenMask_ST;
            int _VRCHideInVR;
            int _VRCHideInDesktop;
            int _VRCHideInVRCamera;
            int _VRCHideInDesktopCamera;
            int _VRCHideInVRMirror;
            int _VRCHideInDesktopMirror;
            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            int _IgnoreLightprobeNormal;
            int _MinLight;
            half _MonochromeLighting;
            int _RenderType;
            half _Cutoff;

            // Textures
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            #if defined(SEPARATE_ALPHA)
            TEXTURE2D(_AlphaTex);
            #endif
            TEXTURE2D(_OcclusionMap);
            TEXTURE2D(_OcclusionDetail);
            TEXTURE2D(_AudioLinkVertexMap);
            SAMPLER(sampler_AudioLinkVertexMap);
            TEXTURE2D(_BumpMap);
            SAMPLER(sampler_BumpMap);
            TEXTURE2D(_DetailNormalMap);
            SAMPLER(sampler_DetailNormalMap);
            TEXTURE2D(_DetailNormalMask);
            SAMPLER(sampler_DetailNormalMask);
            TEXTURE2D(_OutlineTex);
            TEXTURE2D(_OutlineMask);
            SAMPLER(sampler_OutlineTex);
            SAMPLER(sampler_OutlineMask);
            TEXTURE2D(_SpecularMap);
            TEXTURE2D(_SpecularMask);
            TEXTURE2D(_Matcap);
            SAMPLER(sampler_Matcap);
            TEXTURE2D(_MetallicGlossMap);
            TEXTURE2D(_ReflectivityMask);
            TEXTURE2D(_ALMap);
            SAMPLER(sampler_ALMap);
            TEXTURE2D(_EmissionMap);
            TEXTURE2D(_ChromaMask);
            #if defined(_CHROMAMAP)
                TEXTURE2D(_ChromaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                    TEXTURE2D(_Stored);
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
                SAMPLER(bilinear_clamp);
            #endif
            TEXTURE2D(_LumaMask);
            #if defined(_LUMAMAP)
                TEXTURE2D(_LumaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef POINT_CLAMP
                #define POINT_CLAMP
                SAMPLER(point_clamp);
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
                TEXTURE2D(_Udon_VideoTex);
            #endif
            TEXTURE2D(_VideoMask);
            TEXTURE2D(_VideoFallback);
            #if defined(_VIDEOMAP)
                TEXTURE2D(_VideoMap);
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
            #endif
            TEXTURE2D(_Udon_CrowdwaveMask);
            TEXTURE2D(_CrowdwaveMask);
            SAMPLER(sampler_Udon_CrowdwaveMask);
            SAMPLER(sampler_CrowdwaveMask);
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            TEXTURE2D(_LTCGIRamp);
            SAMPLER(sampler_LTCGIRamp);
            TEXTURE2D(_SheenMask);
            SAMPLER(sampler_SheenMask);
            TEXTURE2D(_Ramp);
            SAMPLER(sampler_Ramp);
            TEXTURECUBE(_BakedCubemap);
            SAMPLER(sampler_BakedCubemap);

            // PassFunctions
            #if INCLUDE_LTCGI
            
            void LTCGICallbackDiffuse(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.diffuse += output.intensity * output.color;
            }
            
            void LTCGICallbackSpecular(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.specular += output.intensity * output.color;
            }    
            
            #define LTCGI_V2_DIFFUSE_CALLBACK LTCGICallbackDiffuse
            #define LTCGI_V2_SPECULAR_CALLBACK LTCGICallbackSpecular
                
            #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI.cginc"
            #endif

            // Functions
            void ToonMainFragment(MeshData d, inout SurfaceData o, bool facing)
            {
                half2 uv = 0;
                switch (_MainTexUVSet) {
                    case 0: uv = d.uv0; break;
                    case 1: uv = d.uv1; break;
                    case 2: uv = d.uv2; break;
                    case 3: uv = d.uv3; break;
                }
                uv = uv * _MainTex_ST.xy + _MainTex_ST.zw;
                GLOBAL_uv = uv;
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, GLOBAL_uv);
                if (facing) {
                    albedo *= _Color;
                } else {
                    albedo = lerp(_BackfaceColor, albedo * _BackfaceColor, _BackfaceAlbedoTint);
                }
                half3 albedoHSV = RGB2HSV(albedo.rgb);
            
                albedoHSV.x = fmod(albedoHSV.x + _Hue, 1);
                albedoHSV.y = saturate(albedoHSV.y + _Saturation);
                albedoHSV.z = saturate(albedoHSV.z + _Value);
                albedo.rgb = HSV2RGB(albedoHSV);
            
                o.Hue = _Hue;
                o.Saturation = _Saturation;
                o.Value = _Value;
                    
                if (_TintByVertexColor) {
                    albedo.rgb *= d.vertexColor.rgb;
                }
                o.Albedo = albedo.rgb;
                #if defined(NEED_ALBEDO_ALPHA)
                {
                    #if defined(SEPARATE_ALPHA) 
                    o.Alpha = saturate(SAMPLE_TEXTURE2D(_AlphaTex, sampler_MainTex, GLOBAL_uv).r * _AlphaScale);
                    #else
                    o.Alpha = saturate(albedo.a * _AlphaScale);
                    #endif
                }
                #else
                o.Alpha = 1;
                #endif
                o.ShadowSharpness = _ShadowSharpness;
            }
            

            void ToonOcclusionFragment(MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half occlusion = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_MainTex, lerp(globalUv * _OcclusionTiling, d.uv0 * _OcclusionTiling, _OcclusionTilingMode)).r;
                o.Occlusion = lerp(1, occlusion, _OcclusionStrength);
                    
                if (_OcclusionDetailEnabled) {
                    half occlusionDetail = SAMPLE_TEXTURE2D(_OcclusionDetail, sampler_MainTex, lerp(globalUv * _OcclusionDetailTiling, d.uv0 * _OcclusionDetailTiling, _OcclusionDetailTilingMode)).r;
                    o.Occlusion *= lerp(1, occlusionDetail, _OcclusionDetailStrength);
                }
            
                o.OcclusionMode = _OcclusionMode;
            }
            

            
                float4 QuanternionMultiply(float4 a, float4 b)
                {
            
                    return float4(a.w * b.xyz + b.w * a.xyz + cross(a.xyz, b.xyz), a.w * b.w - dot(a.xyz, b.xyz));
                }
            
                float3 QuanternionRotate(float3 pos, float3 vec, float rotate)
                {
            
                    rotate /= 2.0;
            
                    float4 quat1 = float4(vec.xyz, cos(rotate));
                    quat1.xyz *= sin(rotate);
            
                    float4 quat2 = float4(-quat1.x, -quat1.y, -quat1.z, quat1.w);
            
                    float4 mulpos = (quat1 * float4(pos, 0.0)) * quat2;
                    mulpos = QuanternionMultiply(QuanternionMultiply(quat1, float4(pos, 0.0)), quat2);
            
                    return mulpos;
            
                }
            
                void AudioLinkVertex(inout VertexData v)
                {
                    #if defined(_AUDIOLINKVERTEX)
            
                        if (!_EnableAudioLinkVertex) return;
            
                        half2 map = _AudioLinkVertexMap.SampleLevel(sampler_AudioLinkVertexMap, TRANSFORM_TEX(v.uv0.xy, _AudioLinkVertexMap), 0).rg;
                        half value = AudioLinkIsAvailable() ? AudioLinkLerp(float2(map.g * _AudioLinkVertexHistory, _AudioLinkVertexBand)).r * _AudioLinkVertexIntensity : 0.0;
            
                        v.vertex.xyz += v.normal.xyz * value * map.r;
            
                    #endif
                }
            

            void ToonNormalsFragment(inout MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                #if defined(NORMALS_SET)
                float4 normalTex = 0;
                if (_NormalBicubicSampling) {
                    normalTex = tex2DFastBicubicSampleNoChecks(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                } else {
                    normalTex = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                }
                if (_FlipBumpY)
                {
                    normalTex.y = 1 - normalTex.y;
                }
                half3 normal = UnpackNormalScale(normalTex, _BumpScale);
            
                o.Normal = BlendNormals(o.Normal, normal);
                #endif
                    
                #if defined(DETAIL_NORMALS_SET)
                    
                half2 detailUV = 0;
                switch (_DetailNormalsUVSet) {
                    case 0: detailUV = d.uv0; break;
                    case 1: detailUV = d.uv1; break;
                    case 2: detailUV = d.uv2; break;
                    case 3: detailUV = d.uv3; break;
                }
                detailUV = detailUV * _DetailNormalTiling;
                half4 detailNormalTex = SAMPLE_TEXTURE2D(_DetailNormalMap, sampler_DetailNormalMap, detailUV);
                if (_FlipDetailNormalY)
                {
                    detailNormalTex.y = 1 - detailNormalTex.y;
                }
            
                half2 detailMaskUV = 0;
                switch (_DetailNormalMaskUVSet) {
                    case 0: detailMaskUV = d.uv0; break;
                    case 1: detailMaskUV = d.uv1; break;
                    case 2: detailMaskUV = d.uv2; break;
                    case 3: detailMaskUV = d.uv3; break;
                }
                detailMaskUV *= _DetailNormalMaskTiling;
                half detailMask = SAMPLE_TEXTURE2D(_DetailNormalMask, sampler_DetailNormalMask, detailMaskUV).r;
            
                half3 detailNormal = UnpackNormalScale(detailNormalTex, _DetailNormalScale);
                    
                o.Normal = lerp(o.Normal, BlendNormals(o.Normal, detailNormal), detailMask);
            
                #endif
            
                #if defined(NORMALS_SET) || defined(DETAIL_NORMALS_SET)
            
                half3 properNormal = normalize(mul(o.Normal, d.TBNMatrix));
                d.worldSpaceTangent.xyz = cross(d.bitangent.xyz, properNormal);
                d.bitangent.xyz = cross(properNormal, d.worldSpaceTangent.xyz);
                d.TBNMatrix = float3x3(normalize(d.worldSpaceTangent.xyz), d.bitangent, d.worldNormal);
                GLOBAL_pixelNormal = properNormal;
            
                #else
            
                GLOBAL_pixelNormal = normalize(mul(o.Normal, d.TBNMatrix));
            
                #endif
            }
            

            void ToonOutlineVertex(inout VertexData v) {
                #if defined(PASS_OUTLINE)
                half mask = SAMPLE_TEXTURE2D_LOD(_OutlineMask, sampler_OutlineMask, TRANSFORM_TEX(v.uv0, _OutlineMask), 0);
                half3 width = mask * _OutlineWidth * .01;
                width *= min(distance(TransformObjectToWorld(v.vertex.xyz), _WorldSpaceCameraPos) * 3, 1);
                v.vertex.xyz += v.normal.xyz * lerp(width, width * v.color.r, _OutlineWidthAdjustByVertexColor);
                    
                #endif
            }
            

            void ToonOutlineFragment(MeshData d, inout SurfaceData o) {
                half3 outline = SAMPLE_TEXTURE2D(_OutlineTex, sampler_OutlineTex, d.uv0).rgb;
                o.OutlineColor = lerp(_OutlineColor * outline, _OutlineColor * outline * o.Albedo, _OutlineAlbedoTint);
                o.OutlineLightingMode = _OutlineLightingMode;
            }
            

            void ToonSpecularFragment(MeshData d, inout SurfaceData o) {
                #if defined(SPECULAR_ON)
                    
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half2 specularUv = lerp(globalUv * _SpecularTiling, d.uv0 * _SpecularTiling, _SpecularTilingMode);
                half2 specularMaskUv = lerp(globalUv * _SpecularMaskTiling, d.uv0 * _SpecularMaskTiling, _SpecularMaskTilingMode);
            
                half3 specMap = SAMPLE_TEXTURE2D(_SpecularMap, sampler_MainTex, specularUv);
                o.SpecularIntensity = max(0, _SpecularIntensity * specMap.r);
                o.SpecularArea = max(0.01, GSAA_Filament(d.worldNormal, _SpecularRoughness, 0.05, 0.1) * specMap.b);
                o.SpecularAnisotropy = _SpecularAnisotropy;
                o.SpecularAlbedoTint = _SpecularAlbedoTint * specMap.g;
                o.SpecularSharpness = _SpecularSharpness;
                o.SpecularArea = lerp(o.SpecularArea, o.SpecularArea * SAMPLE_TEXTURE2D(_SpecularMask, sampler_MainTex, specularMaskUv).r, _SpecularMaskStrength);
                #endif
            }
            

            void ToonReflectionFragment(MeshData d, inout SurfaceData o) {
                #if defined(REFLECTION_MODE_OFF)
                return;
                #endif
            
                o.ReflectionBlendMode = _ReflectionBlendMode;
            
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half mask = SAMPLE_TEXTURE2D(_ReflectivityMask, sampler_MainTex, lerp(globalUv * _ReflectivityMaskTiling, d.uv0 * _ReflectivityMaskTiling, _ReflectivityMaskTilingMode)).r;
                mask *= _ReflectivityLevel;
                    
                #if defined(REFLECTION_MODE_PBR) || defined(REFLECTION_MODE_BAKED_CUBEMAP)
                        
                half4 metalSmooth = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MainTex, lerp(globalUv * _MetallicGlossMapTiling, d.uv0 * _MetallicGlossMapTiling, _MetallicGlossMapTilingMode));
                int hasMetallicSmooth = _MetallicGlossMap_TexelSize.z > 8;
                half metal = metalSmooth.r;
                half smooth = metalSmooth.a;
                if (_RoughnessMode)
                {
                    smooth = 1 - smooth;
                }
                metal = remap(metal, 0, 1, _MetallicRemap.x, _MetallicRemap.y);
                smooth = remap(smooth, 0, 1, _SmoothnessRemap.x, _SmoothnessRemap.y);
                o.Metallic = lerp(_Metallic, metal, hasMetallicSmooth);
                o.Smoothness = lerp(_Smoothness, smooth, hasMetallicSmooth);
                o.Anisotropy = _ReflectionAnisotropy;
                    
                #elif defined(REFLECTION_MODE_MATCAP)
                    
                half3 upVector = half3(0,1,0);
                half2 remapUV = calcMatcapUV(upVector, d.worldSpaceViewDir, GLOBAL_pixelNormal);
                half4 spec = 0; 
                spec = SAMPLE_TEXTURE2D_LOD(_Matcap, sampler_Matcap, remapUV, _MatcapBlur * UNITY_SPECCUBE_LOD_STEPS);
            
                spec.rgb *= lerp(1, o.Albedo, _MatcapTintToDiffuse);
                o.BakedReflection = spec.rgb;
                    
                #endif
            
                o.Reflectivity = mask;
            }
            

            void ToonALFragment(MeshData d, inout SurfaceData o) {
                #if defined(AL_MODE_NONE)
                    return;
                #else
            
                if(AudioLinkIsAvailable()) {
                    half2 alUV = 0;
            
                    half2 globalUv = 0;
            
                    #if defined(GLOBAL_UV_SET)
                    globalUv = GLOBAL_uv;
                    #else
                    globalUv = d.uv0;
                    #endif
            
                    switch (_ALMapUVSet) {
                        case 0: alUV = globalUv; break;
                        case 1: alUV = d.uv1; break;
                        case 2: alUV = d.uv2; break;
                        case 3: alUV = d.uv3; break;
                    }
                    half4 alMask = SAMPLE_TEXTURE2D(_ALMap, sampler_ALMap, alUV);
            
                    #if defined(AL_MODE_SINGLE_CHANNEL)
            
                    half sampledAL = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        sampledAL = AudioLinkData(int2(0, _ALBand)).x;
                    } else {
                        sampledAL = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel, _ALBand)).x;
                    }
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
            
                    #elif defined(AL_MODE_PACKED_MAP)
            
                    half audioDataBass = 0;
                    half audioDataMids = 0;
                    half audioDataHighs = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        audioDataBass = AudioLinkData(ALPASS_AUDIOBASS).x;
                        audioDataMids = AudioLinkData(ALPASS_AUDIOLOWMIDS).x;
                        audioDataHighs = (AudioLinkData(ALPASS_AUDIOHIGHMIDS).x + AudioLinkData(ALPASS_AUDIOTREBLE).x) * 0.5;
                    } else {
                        audioDataBass = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,0)).x;
                        audioDataMids = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,1)).x;
                        audioDataHighs = (AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,2)).x + AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,3)).x) * 0.5;
                    }
            
                    audioDataMids = clamp(audioDataMids, 0, 0.98);
            
                    half tLow = smoothstep((1-audioDataBass), (1-audioDataBass) + 0.01, alMask.r) * alMask.a;
                    half tMid = smoothstep((1-audioDataMids), (1-audioDataMids) + 0.01, alMask.g) * alMask.a;
                    half tHigh = smoothstep((1-audioDataHighs), (1-audioDataHighs) + 0.01, alMask.b) * alMask.a;
            
                    half4 emissionChannelRed = lerp(alMask.r, tLow, _ALGradientOnRed) * _ALPackedRedColor * audioDataBass;
                    half4 emissionChannelGreen = lerp(alMask.g, tMid, _ALGradientOnGreen) * _ALPackedGreenColor * audioDataMids;
                    half4 emissionChannelBlue = lerp(alMask.b, tHigh, _ALGradientOnBlue) * _ALPackedBlueColor * audioDataHighs;
                    half3 em = emissionChannelRed.rgb + emissionChannelGreen.rgb + emissionChannelBlue.rgb;
                    
                    #elif defined(AL_MODE_UV_BASED)
            
                    half2 aluv;
                    aluv = half2(alUV.x * _ALUVWidth, alUV.y);
                    half sampledAL = AudioLinkLerp(aluv).x;
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
                        
                    #else
                    half3 em = 0;
                    #endif
            
                    half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                    NoV = lerp(NoV, 1 - NoV, _ALEmissionDotMaskInvert);
                    NoV = saturate(pow(NoV, _ALEmissionDotMaskSmoothing));
                    o.Emission += lerp(em, em * NoV, _ALEmissionDotMask);
                }
            
                #endif
            }
            

            void ToonEmissionFragment(inout SurfaceData o) {
                #if defined(_EMISSION)
                half3 emission = SAMPLE_TEXTURE2D(_EmissionMap, sampler_MainTex, GLOBAL_uv).rgb;
                emission *= lerp(emission, emission * o.Albedo, _EmissionTintToDiffuse) * _EmissionColor;
                o.Emission += emission;
                #endif
                o.EmissionScaleWithLight = _EmissionScaleWithLight;
                o.EmissionLightThreshold = _EmissionScaleWithLightSensitivity;
            }
            

            void ToonRimLightFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMLIGHT_ON)
                    
                #ifndef USING_DIRECTIONAL_LIGHT
                    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(d.worldSpacePosition));
                #else
                    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
            
                half3 normal = 0;
                #if defined(PIXEL_NORMAL_SET)
                normal = GLOBAL_pixelNormal;
                #else
                normal = o.Normal;
                #endif
            
                half lightNoL = saturate(dot(normal, lightDir));
                half SVDNoN = abs(dot(d.svdn, normal));
            
                half rimIntensity = saturate((1 - SVDNoN)) * saturate(pow(lightNoL, _RimThreshold));
                rimIntensity = smoothstep(_RimRange - _RimSharpness, _RimRange + _RimSharpness, rimIntensity);
                half4 rim = rimIntensity * _RimIntensity;
            
                // Rim Light Env Tint
                half3 env = 0;
                #if defined(UNITY_PASS_FORWARDBASE)
                    env = getEnvReflection(d.worldSpaceViewDir.xyz, d.worldSpacePosition.xyz, normal, o.Smoothness, 5);
                #endif
                    
                o.RimLight = rim * _RimTint * lerp(1, half4(o.Albedo.rgb,1), _RimAlbedoTint) * lerp(1, half4(env.rgb,1), _RimEnvironmentTint);
                o.RimLight *= _RimTint.a;
                o.RimAttenuation = _RimAttenuation;
                    
                #endif
            }
            

            void ToonShadowRimFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMSHADOW_ON)
            
                Light mainLight = GetMainLight(0..xxxx, d.worldSpacePosition, 0..xxxx);
            
                float3 lightDir = mainLight.direction;
                    
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
                half lightNoL = saturate(dot(GLOBAL_pixelNormal, lightDir));
                half SVDNoN = abs(dot(d.svdn, GLOBAL_pixelNormal));
                half shadowRimIntensity = saturate((1 - SVDNoN)) * pow(1 - lightNoL, _ShadowRimThreshold * 2);
                shadowRimIntensity = smoothstep(_ShadowRimRange - _ShadowRimSharpness, _ShadowRimRange + _ShadowRimSharpness, shadowRimIntensity);
            
                o.RimShadow = lerp(1, (_ShadowRimTint * lerp(1, o.Albedo.rgbb, _ShadowRimAlbedoTint)), shadowRimIntensity);
            
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
                #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            bool ShouldReact() { return AudioLinkIsAvailable() && !_ChromaForceIdle; }
            
            float ChronoTime(int band)
            {
                if (ShouldReact()) return AudioLinkGetChronoTime(0, band);
                return _Time.x;
            }
            
            fixed3 ThemeColor(int theme)
            {
                theme %= 4;
                if (ShouldReact() && !_ChromaForceTheme)
                {
                    return AudioLinkData(ALPASS_THEME_COLOR0 + int2(theme, 0));
                } else switch (theme) {
                    case 0:
                        return _ChromaTheme0;
            
                    case 1:
                        return _ChromaTheme1;
            
                    case 2:
                        return _ChromaTheme2;
            
                    case 3:
                        return _ChromaTheme3;
            
                    default:
                        return 0.0;
                }
            }
            
            // float3 ThemeHue(float value)
            // {
            //     float scaledTime = value * 4.0;
            //     return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime));
            // }
            
            fixed3 ChromaEffect(int effect, int band, float progress, float value)
            {
                fixed dft = 0.0;
                if (effect > 8)
                    if (ShouldReact())
                    {
                        dft = AudioLinkLerpMultiline(ALPASS_DFT + float2(progress * AUDIOLINK_ETOTALBINS, 0.0)).g * 0.9;
                    } else
                        dft = (_Time.x * _ChromaSpeed) - progress;
            
                switch (effect)
                {
                    case 1: // Color Theme 1 to Color Theme 2
                        return lerp(ThemeColor(0), ThemeColor(1), progress) * value;
            
                    case 2: // Color Theme 3 to Color Theme 4
                        return lerp(ThemeColor(2), ThemeColor(3), progress) * value;
            
                    case 3: // Color Themes 1 - 4
                        float scaledTime = progress * 3.0;
                        return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime)) * value;
            
                    case 4: // Solid Hue Chronotensity
                        return HSV2RGB(float3(ChronoTime(band) * _ChromaSpeed, 1.0, value));
            
                    case 5: // Hue Value
                        return HSV2RGB(float3(ShouldReact() ? value : (_Time.x + .5 * _ChromaSpeed), 1.0, value));
            
                    case 6: // Hue Time Gradient
                        return HSV2RGB(float3((_Time.x * 2.0 * _ChromaSpeed) - progress, 1.0, value));
            
                    case 7: // Hue Time Gradient + Time Pulse Gradient
                        return HSV2RGB(float3(((_Time.y / 5.0) * _ChromaSpeed) - progress, 1.0, value * abs(sin((_Time.y * _ChromaSpeed) - (progress * 15.0)))));
            
                    case 8: // Hue Chronotensity Gradient
                        return HSV2RGB(float3((((ChronoTime(band) * _ChromaSpeed) + AudioLinkGetChronoTime(4, band)) * 0.33) - progress, 1.0, value));
            
                    case 9: // Waveform Hue
                        return HSV2RGB(float3(dft, 1.0, value));
            
                    case 10: // Warped Waveform Hue
                        return HSV2RGB(float3((sin((dft - progress) * UNITY_PI) + 1.0) / 2.0, 1.0, value));
            
                    default:
                        return 0.0;
                }
            }
            
            void ChromaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_AUDIOLINKCHROMA)
            
                    if (!_EnableAudioLinkChroma) return;
            
                    #if defined(_LUMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (!_ReactPriority) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _ChromaMask);
            
                    fixed4 mask = _ChromaMask.Sample(bilinear_clamp, uv);
                    #if defined(_CHROMAMAP)
                        fixed4 map = _ChromaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
            
                        int band = floor(clamp(mask.a * 4.0, 0.0, 3.99));
                    #else
                        uv = rotate(uv - 0.5, _ChromaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, clamp(uv.x, 0.0, 1.0));
            
                        int band = _ChromaBand;
                    #endif
                    map.a = pow(map.a, _ChromaWarp);
            
                    fixed value = 1.0;
                    if (ShouldReact()) value = AudioLinkLerp(float2(map.a * _ChromaHistory, band)).r;
            
                    fixed3 color = 0.0;
                    color += ChromaEffect(_ChromaModeR, band, map.a, value) * map.r;
                    #if defined(_CHROMAMAP)
                        color += ChromaEffect(_ChromaModeG, band, map.a, value) * map.g;
                        color += ChromaEffect(_ChromaModeB, band, map.a, value) * map.b;
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.114)), _ChromaBiased) * _ChromaTint * mask.rgb;
            
                    o.Emission += color;
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            fixed3 LumaGradient(int grad, fixed prog)
            {
                return AudioLinkLerp(float2(prog * 127.0, LUMA_START - (grad % LUMA_POWER)));
            }
            
            fixed3 LumaLegacyGradient(int grad, fixed prog)
            {
                #if defined(_LUMALEGACY)
                    if (grad < 4)
                    {
                        fixed2 theme = fixed2((grad / 2) * LUMA_LEGACY_THEME_SIZE, -(grad % 2) * LUMA_LEGACY_THEME_SIZE);
                        return _Stored.SampleLevel(bilinear_clamp, (LUMA_LEGACY_THEME_POSITION + theme) / LUMA_LEGACY_SIZE, 0);
                    } else {
                        prog = GRADSTART[grad - 4] + (LUMA_LEGACY_LENGTH * prog);
                        return _Stored.SampleLevel(bilinear_clamp, fixed2(prog, LUMA_LEGACY_Y) / LUMA_LEGACY_SIZE, 0);
                    }
                #endif
            
                return 0.0;
            }
            
            void LumaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_LUMA)
            
                    if (!_EnableLuma) return;
            
                    #if defined(_AUDIOLINKCHROMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (_ReactPriority) return;
                    #endif
            
                    #if defined(_LUMALEGACY)
                        if (!IsLumaAvailable() && !IsLumaLegacyAvailable()) return;
                    #else
                        if (!IsLumaAvailable()) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _LumaMask);
            
                    fixed4 mask = _LumaMask.Sample(bilinear_clamp, uv);
                    #if defined(_LUMAMAP)
                        fixed4 map = _LumaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
                    #else
                        uv = rotate(uv - 0.5, _LumaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, uv.x);
                    #endif
            
                    map.a = pow(map.a, _LumaWarp);
                    fixed3 color = 0.0;
            
                    #if defined(_LUMALEGACY)
                        if (IsLumaAvailable())
                        {
                            color += LumaGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        } else {
                            map.a = 1.0 - map.a;
                            color += LumaLegacyGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaLegacyGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaLegacyGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        }
                    #else
                        color += LumaGradient(_LumaGrad1, map.a) * map.r;
                        #if defined(_LUMAMAP)
                            color += LumaGradient(_LumaGrad2, map.a) * map.g;
                            color += LumaGradient(_LumaGrad3, map.a) * map.b;
                        #endif
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _LumaBiased) * _LumaTint * mask.rgb;
            
                    o.Emission += color;
            
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            void VideoFrag(MeshData d, inout SurfaceData o) {
            
                #if defined(_VIDEO)
                    if (!_EnableVideo) return;
            
                    float2 videouv = TRANSFORM_TEX(d.uv0, _VideoMask);
                    fixed4 video = 0.0;
            
                    #if defined(_VIDEOMAP)
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                        videouv = _VideoMap.SampleLevel(bilinear_clamp, videouv, 0).rg;
                    #else
                        videouv -= 0.5;
                        videouv = rotate(videouv, _VideoRotation);
                        videouv.y *= _VideoRatio;
                        videouv += 0.5;
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                    #endif
            
            
            
                    if (videouv.x > 0.0 && videouv.x < 1.0 && videouv.y > 0.0 && videouv.y < 1.0 && any(mask > 0.01))
                    {
                        if (IsVideoAvailable())
                        {
                            #if defined(_VIDEOAST)
                                videouv = TRANSFORM_TEX(videouv, _Udon_VideoTex);
                            #endif
                            video.rgb = _Udon_VideoTex.SampleLevel(bilinear_clamp, videouv, 0);
                        } else video.rgb = _VideoFallback.SampleLevel(bilinear_clamp, videouv, 0);
            
                        fixed3 videocolor = video.rgb * mask.rgb * _VideoTint.rgb;
                        #if defined(_VIDEOALBEDO)
                            o.Albedo.rgb = lerp(o.Albedo.rgb, videocolor, _VideoTint.a);
                        #else
                            o.Emission += videocolor;
                        #endif
                    }
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            fixed4 SampleCrowdwave(float3 objectPos)
            {
            
                float2 position = mul(unity_ObjectToWorld, float4(objectPos, 1.0)).xz;
            
                float2 worldPosition = _Udon_CrowdwaveMeta._m20_m21_m22_m23.xz;
                float4 screenBounds = _Udon_CrowdwaveMeta._m00_m01_m02_m03;
                float2 worldBounds = _Udon_CrowdwaveMeta._m10_m11_m12_m13.xy;
                fixed worldRotation = _Udon_CrowdwaveMeta._m20_m21_m22_m23.w;
                half intensity = _Udon_CrowdwaveMeta._m10_m11_m12_m13.z;
                //_Udon_CrowdwaveMeta._m10_m11_m12_m13.w;
                //_Udon_CrowdwaveMeta._m30_m31_m32_m33;
            
                intensity = intensity > 1.0 ? intensity - 1.0 : 0.0;
            
                position -= worldPosition;
                position.xy = rotate(position.xy, worldRotation);
                position.xy += worldBounds / 2.0;
                position.xy /= worldBounds;
            
                half mask = _Udon_CrowdwaveMask.SampleLevel(sampler_Udon_CrowdwaveMask, position.xy, 0);
                if (!IsVideoAvailable() || position.x < 0.0 || position.x > 1.0 || position.y < 0.0 || position.y > 1.0) mask = 0.0;
            
                position.xy *= screenBounds.xy;
                position.xy += screenBounds.zw;
            
                fixed3 color = _Udon_VideoTex.SampleLevel(bilinear_clamp, position.xy, 0) * intensity * mask;
            
                return fixed4(color.xyz, mask);
            
            }
                
            void CrowdwaveFrag(MeshData d, inout SurfaceData o)
            {
            
                #if defined(_CROWDWAVE)
                    if (!_EnableCrowdwave) return;
            
                    half3 crowdwaveMask = _CrowdwaveMask.Sample(sampler_CrowdwaveMask, TRANSFORM_TEX(d.uv0, _CrowdwaveMask));
            
                    #if defined(_CROWDWAVERANGE)
                        fixed3 color = SampleCrowdwave(d.localSpacePosition).rgb;
                    #else
                        fixed3 color = SampleCrowdwave(0.0).rgb;
                    #endif
            
                    o.Emission += lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _CrowdwaveBias) * _CrowdwaveTint * crowdwaveMask;
                #endif
            }
            

            void LTCGICustomGI(MeshData d, SurfaceData o, inout half3 indirectSpecular, inout half3 indirectDiffuse)
            {
                #if !defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            o.Normal.xyz,
                            d.worldSpaceViewDir,
                            saturate((1 - o.Smoothness) + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            indirectSpecular += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            indirectSpecular += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        indirectDiffuse += ltcgiData.diffuse * _LTCGIDiffuseIntensity;
                    #endif
                }
                #endif
            }
            

            void LTCGIColor(MeshData d, FragmentData i, inout SurfaceData o, inout half4 FinalColor, bool facing)
            {
                #if defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        #if defined(PASS_OUTLINE)
                        return;
                        #endif
            
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        float3 viewDir = d.worldSpaceViewDir;
                        if (!facing)
                        {
                            viewDir = -d.worldSpaceViewDir;
                        }
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            d.worldNormal.xyz,
                            viewDir,
                            saturate(0.5 + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            FinalColor.rgb += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            FinalColor.rgb += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        half3 rampHSV = RGB2HSV(ltcgiData.diffuse);
                        rampHSV.z = tanh(rampHSV.z);
                        rampHSV.z = SAMPLE_TEXTURE2D(_LTCGIRamp, sampler_LTCGIRamp, half2(rampHSV.z, 0)).r;
                        FinalColor.rgb += HSV2RGB(rampHSV) * o.Albedo * _LTCGIDiffuseIntensity;
                        if (_LTCGIAlphaPremultiply)
                        {
                            FinalColor.rgb *= FinalColor.a;
                        }
                    #endif
                }
                #endif
            }
            

            void Toon_SheenFragment(MeshData d, inout SurfaceData o) {
                half sheenMask = _SheenMask.SampleLevel(sampler_SheenMask, TRANSFORM_TEX(d.uv0, _SheenMask), 0).r;
                if (sheenMask < 0.5) return;
            
                half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                NoV = saturate(pow(NoV, _SheenPower));
                half3 blendSource = lerp(_SheenTint, o.Albedo, _SheenAlbedoTint);
                half3 blended = blendSource;
                switch (_SheenBlendType)
                {
                    case 0: blended = BlendOverlay(o.Albedo, blendSource * NoV); break;
                    case 1: blended = BlendLighten(o.Albedo, blendSource * NoV); break;
                    case 2: blended = BlendScreen(o.Albedo, blendSource * NoV); break;
                    case 3: blended = o.Albedo * blendSource * NoV; break;
                }
                o.Albedo = lerp(o.Albedo, blended, _SheenStrength);
            
            }
            

            void VRCFeaturesVertex(inout VertexData v)
            {
                #if defined(VRC_FEATURES)
                bool isInVRHandCam = _VRChatCameraMode == 1;
                bool isInDesktopHandCam = _VRChatCameraMode == 2;
                bool isInVR = isVR();
                bool isInDesktop = !isInVR && !isInDesktopHandCam;
                bool isInVRMirror = _VRChatMirrorMode == 1;
                bool isInDesktopMirror = _VRChatMirrorMode == 2;
            
                if (_VRCHideInVR && isInVR)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktop && isInDesktop)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRCamera && isInVRHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopCamera && isInDesktopHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRMirror && isInVRMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopMirror && isInDesktopMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                #endif
            }
            

            half4 calcRamp(half NdL, half attenuation, half occlusion, int occlusionMode)
            {
                half remapRamp;
                remapRamp = NdL * 0.5 + 0.5;
                remapRamp *= lerp(1, occlusion, occlusionMode);
                #if defined(UNITY_PASS_FORWARDBASE)
                remapRamp *= attenuation;
                #endif
                half4 ramp = SAMPLE_TEXTURE2D(_Ramp, sampler_Ramp, half2(remapRamp, 0));
                return ramp;
            }
            
            half3 calcIndirectSpecular(half lightAttenuation, MeshData d, SurfaceData o, half roughness, half3 reflDir, half3 indirectLight, float3 fresnel, half4 ramp)
            {
                half3 spec = half3(0,0,0);
            
                #if defined(REFLECTION_MODE_OFF)
                return spec;
                #endif
            
                #if defined(REFLECTION_MODE_MATCAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    spec = o.BakedReflection;
                    if(o.ReflectionBlendMode != 1)
                    {
                        spec *= (indirectLight + (_LightColor0 * lightAttenuation) * 0.5);
                    }
                }
                #endif
            
                #if defined(REFLECTION_MODE_PBR) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 reflectionUV1 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
            
                    half3 indirectSpecular;
                    half interpolator = unity_SpecCube0_BoxMin.w;
            
                    UNITY_BRANCH
                    if (interpolator < 0.99999)
                    {
                        half3 reflectionUV2 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                        half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                        indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
                    }
                    else
                    {
                        indirectSpecular = probe0sample;
                    }
            
                    if (!any(indirectSpecular))
                    {
                        indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        indirectSpecular *= indirectLight;
                    }
                    spec = indirectSpecular * fresnel;
                }
                #endif
            
                #if defined(REFLECTION_MODE_BAKED_CUBEMAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    indirectSpecular *= indirectLight;
                    spec = indirectSpecular * fresnel;
                }
                #endif
                return spec;
            }
            
            half3 calcDirectSpecular(MeshData d, SurfaceData o, float lightNoL, float NoH, float NoV, float lightLoH, half3 lightColor, half3 lightHalfVector, half anisotropy)
            {
                half specularIntensity = o.SpecularIntensity;
                half3 specular = half3(0,0,0);
                half smoothness = max(0.01, (o.SpecularArea));
                smoothness *= 1.7 - 0.7 * smoothness;
            
                float rough = max(smoothness * smoothness, 0.0045);
                float Dn = D_GGX(NoH, rough);
                float3 F = 1-F_Schlick(lightLoH, 0);
                float V = V_SmithGGXCorrelated(NoV, lightNoL, rough);
                float3 directSpecularNonAniso = max(0, (Dn * V) * F);
            
                anisotropy *= saturate(5.0 * smoothness);
                float at = max(rough * (1.0 + anisotropy), 0.001);
                float ab = max(rough * (1.0 - anisotropy), 0.001);
                float D = D_GGX_Anisotropic(NoH, lightHalfVector, d.worldSpaceTangent, d.bitangent, at, ab);
                float3 directSpecularAniso = max(0, (D * V) * F);
            
                specular = lerp(directSpecularNonAniso, directSpecularAniso, saturate(abs(anisotropy * 100)));
                specular = lerp(specular, smoothstep(0.5, 0.51, specular), o.SpecularSharpness) * 3 * lightColor.xyz * specularIntensity; // Multiply by 3 to bring up to brightness of standard
                specular *= lerp(1, o.Albedo, o.SpecularAlbedoTint);
                specular = clamp(specular, 0, specularIntensity);
                return specular;
            }
            
            half3 calcReflectionBlending(SurfaceData o, half reflectivity, half3 col, half3 indirectSpecular)
            {
                half3 reflection = indirectSpecular.xyzz * reflectivity;
            
                // Doing a Lerp allows shaders to smoothly transition between blend modes
                col = lerp(
                    col + reflection, // Additive
                    lerp(
                        lerp(col, col * indirectSpecular.xyz, reflectivity), // Multiplicitive
                        col - reflection, // Subtractive
                        saturate(o.ReflectionBlendMode - 1)
                    ),
                    saturate(o.ReflectionBlendMode)
                );
                return col;
            }
            
            half4 calcEmission(SurfaceData o, half lightAvg)
            {
                #if defined(UNITY_PASS_FORWARDBASE) // Emission only in Base Pass, and vertex lights
                    float4 emission = 0;
                    emission = half4(o.Emission, 1);
            
                    half intensity = length(emission.rgb);
                    half3 emissionHSV = RGB2HSV(normalize(emission.rgb));
                    emissionHSV.x = fmod(emissionHSV.x + o.Hue, 1);
                    emissionHSV.y = saturate(emissionHSV.y + o.Saturation);
                    emissionHSV.z = saturate(emissionHSV.z + o.Value);
                    emission.rgb = HSV2RGB(emissionHSV) * intensity;
            
                    float4 scaledEmission = emission * saturate(smoothstep(1 - o.EmissionLightThreshold, 1 + o.EmissionLightThreshold, 1 - lightAvg));
                    float4 em = lerp(emission, scaledEmission, o.EmissionScaleWithLight);
                    return em;
                #else
                    return 0;
                #endif
            }
            
            void XSToonLighting(MeshData d, FragmentData i, SurfaceData o, inout half4 FinalColor)
            {
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half reflectance = o.Reflectivity;
                float oneMinusReflectivity = 1.0 - 0.04 - o.Metallic * (1.0 - 0.04);
                half3 f0 = 0.16 * reflectance * reflectance * (1 - o.Metallic) + o.Albedo * o.Metallic;
                half3 indirectDiffuse = 1;
                half3 indirectSpecular = 0;
                half3 directSpecular = 0;
                half occlusion = o.Occlusion;
                half perceptualRoughness = 1 - o.Smoothness;
                half3 tangentNormal = o.Normal;
                o.Normal = normalize(mul(o.Normal, d.TBNMatrix));
                half3 reflDir = calcReflView(d.worldSpaceViewDir, o.Normal);
            
                // Light Direction, based on method derived by Xiexe and Merlin
                #ifndef USING_DIRECTIONAL_LIGHT
                    half3 lightDir = UnityWorldSpaceLightDir(d.worldSpacePosition);
                #else
                    half3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
            
                half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                lightDir = (lightDir + probeLightDir);
            
                #if !defined(POINT) && !defined(SPOT)
                if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
                {
                    lightDir = half4(1, 1, 1, 0);
                }
                #endif
                lightDir = Unity_SafeNormalize(lightDir);
            
                // Attenuation
                UNITY_LIGHT_ATTENUATION(lightAttenuation, i, d.worldSpacePosition);
            
                // fix for rare bug where light atten is 0 when there is no directional light in the scene
                #ifdef UNITY_PASS_FORWARDBASE
                    if(all(_LightColor0.rgb == 0.0))
                        lightAttenuation = 1.0;
                #endif
            
                #if defined(USING_DIRECTIONAL_LIGHT)
                    half sharp = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, lightAttenuation); //Converge at the center line
                #endif
            
                half3 lightColor = _LightColor0.rgb;
            
                half3 lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                half lightNoL = dot(o.Normal, lightDir);
                half lightLoH = dot(lightDir, lightHalfVector);
            
                half NoV = abs(dot(o.Normal, d.worldSpaceViewDir)) + 1e-5;
                half NoH = saturate(dot(o.Normal, lightHalfVector));
                half3 stereoViewDir = calcStereoViewDir(d.worldSpacePosition);
                half NoSVDN = abs(dot(stereoViewDir, o.Normal));
            
                // Aniso Refl
                half3 reflViewAniso = 0;
            
                float3 anisotropicDirection = o.Anisotropy >= 0.0 ? d.bitangent : d.worldSpaceTangent.xyz;
                float3 anisotropicTangent = cross(anisotropicDirection, d.worldSpaceViewDir);
                float3 anisotropicNormal = cross(anisotropicTangent, anisotropicDirection);
                float bendFactor = abs(o.Anisotropy) * saturate(5.0 * perceptualRoughness);
                float3 bentNormal = normalize(lerp(o.Normal, anisotropicNormal, bendFactor));
                reflViewAniso = reflect(-d.worldSpaceViewDir, bentNormal);
            
                // Indirect diffuse
                #if !defined(LIGHTMAP_ON)
                    half3 L0 = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
                    indirectDiffuse.r = shEvaluateDiffuseL1Geomerics(L0.r, unity_SHAr.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.g = shEvaluateDiffuseL1Geomerics(L0.g, unity_SHAg.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.b = shEvaluateDiffuseL1Geomerics(L0.b, unity_SHAb.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse = max(0, indirectDiffuse);
                #elif defined(UNITY_PASS_FORWARDBASE)
                    // This here is an attempt to provide a somewhat usable ramp for lightmaps
                    half2 lightmapUV = d.lightmapUv.xy;
                    half4 bakedColorTex = 0;
                    half3 lightMap = tex2DFastBicubicLightmap(lightmapUV, bakedColorTex);
            
                    // Support basic directionality
                    #if defined(DIRLIGHTMAP_COMBINED)
                        half4 lightMapDirection = tex2DFastBicubicSample(unity_LightmapInd, samplerunity_Lightmap, lightmapUV);
            
                        // use lightmap direction if we can, realtim light is ignored in that case
                        lightDir.xyz = lightMapDirection.xyz - 0.5;
                        lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                        lightNoL = dot(o.Normal, lightDir);
                        lightLoH = dot(lightDir, lightHalfVector);
            
                        lightMap = DecodeDirectionalLightmap(lightMap, lightMapDirection, o.Normal);
            
                        lightColor = lightMap * 0.6;
                        indirectDiffuse = lightMap * 0.4;
                    #else
                        // Hacky way to support both cases of dirlight + baked and bakedy only but no directionality
                        // baked generates a light dir of 0,1,0
                        if (dot(lightDir.xyz, half3(0,1,0)) > 0.95) {
                            lightDir.xyz = 0;
                            lightNoL = 1;
                        }
                        indirectDiffuse = lightMap;
                    #endif
            
                    // we can end up using this twice, once above in the Dirlight logic and once here if both a realtime light
                    // and baked lightmap are present
                    half sharp2 = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, saturate(length(lightMap)));
                #endif
                indirectDiffuse *= lerp(occlusion, 1, o.OcclusionMode);
            
                if (_MonochromeLighting > 0)
                {
                    indirectDiffuse = lerp(indirectDiffuse, dot(indirectDiffuse, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
            
                bool lightEnv = any(lightDir.xyz);
                // if there is no realtime light - we rely solely on probes
                if (!lightEnv) {
                    lightColor = indirectDiffuse * 0.6;
                    indirectDiffuse = indirectDiffuse * 0.4;
                }
            
                #if defined(UNITY_PASS_FORWARDBASE)
                indirectDiffuse = lerp(indirectDiffuse, max(indirectDiffuse, 0.05), _MinLight);
                #endif
            
                half lightAvg = (dot(indirectDiffuse.rgb, grayscaleVec) + dot(lightColor.rgb, grayscaleVec)) / 2;
            
                // Light Ramp
                half4 ramp = 1;
                half4 diffuse = 1;
                ramp = calcRamp(lightNoL, lightAttenuation, occlusion, o.OcclusionMode);
                // Begin Added
                if (_MonochromeLighting > 0)
                {
                    lightColor = lerp(lightColor, dot(lightColor, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
                // End Added
                diffuse = calcDiffuse(lightAttenuation, o.Albedo.rgb, indirectDiffuse, lightColor, ramp);
            
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                float4 vLightAttenuations = 0;
                float4x4 vLightColors = getVertexLightsColors(d.worldSpacePosition, o.Normal, vLightAttenuations, false);
                float4x4 vLightDirections = getVertexLightsDir(d.worldSpacePosition);
                float4x4 vLightHalfVectors = 0;
                float4 vLightNoLs = 0;
                float4 vLightLoHs = 0;
                half4 vRamp = 1;
            
                [unroll(4)]
                for (int i = 0; i < 4; i++)
                {
                    vLightHalfVectors[i].rgb = Unity_SafeNormalize(vLightDirections[i] + d.worldSpaceViewDir);
                    vLightLoHs[i] = saturate(dot(vLightDirections[i], vLightHalfVectors[i]));
                    vLightNoLs[i] = saturate(dot(o.Normal, vLightDirections[i]));
                    vRamp = calcRamp(vLightNoLs[i], vLightAttenuations[i], occlusion, o.OcclusionMode);
                    diffuse += calcDiffuse(vLightAttenuations[i], o.Albedo.rgb, 0, vLightColors[i], vRamp);
                }
                #endif
            
                // Rims
                half3 rimLight = 0;
                #if defined(RIMLIGHT_ON)
                rimLight = o.RimLight.rgb;
                rimLight *= lightColor.xyz + indirectDiffuse.xyz;
                rimLight *= lerp(1, lightAttenuation + indirectDiffuse.xyz, o.RimAttenuation);
                #endif
            
                half3 rimShadow = 1;
                #if defined(RIMSHADOW_ON)
                rimShadow = o.RimShadow;
                #endif
            
                float3 fresnel = F_Schlick(NoV, f0);
            
                #if !defined(REFLECTION_MODE_OFF)
                indirectSpecular = calcIndirectSpecular(lightAttenuation, d, o, perceptualRoughness, reflViewAniso, indirectDiffuse, fresnel, ramp) * occlusion;
                #endif
            
                #if defined(SPECULAR_ON)
                directSpecular = calcDirectSpecular(d, o, lightNoL, NoH, NoV, lightLoH, lightColor, lightHalfVector, o.SpecularAnisotropy) * lightNoL * occlusion * lightAttenuation;
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                {
                    [unroll(4)]
                    for (int i = 0; i < 4; i++)
                    {
                        directSpecular += calcDirectSpecular(d, o, vLightNoLs[i], vLightLoHs[i], NoV, vLightLoHs[i], vLightColors[i], vLightHalfVectors[i], o.SpecularAnisotropy) * vLightNoLs[i] * occlusion * vLightAttenuations[i];
                    }
                }
                #endif
                #endif
            
                // Standard-Like transparent (premult alpha)
                if (_RenderType == 2)
                {
                    diffuse.rgb *= o.Alpha;
                    o.Alpha = 1 - (oneMinusReflectivity) + o.Alpha * (oneMinusReflectivity);
                }
            
                #if !defined(_NATIVE_A2C)
                {
                    // Standard-Like cutout
                    if (_RenderType == 1)
                    {
                        clip(o.Alpha - _Cutoff);
                    }
                }
                #endif
            
                FinalColor.rgb = diffuse.rgb * rimShadow.rgb;
            
                #if !defined(REFLECTION_MODE_OFF)
                FinalColor.rgb = calcReflectionBlending(o, reflectance, FinalColor.rgb, indirectSpecular);
                #endif
            
                FinalColor.rgb += max(directSpecular.xyz, rimLight.rgb).rgb;
                FinalColor.rgb += calcEmission(o, lightAvg);
            
                // Outline
                #if defined(PASS_OUTLINE)
                    half3 outlineColor = 0;
                    half3 ol = o.OutlineColor;
                    outlineColor = ol * saturate(lightAttenuation * lightNoL) * lightColor.rgb;
                    outlineColor += indirectDiffuse * ol;
                    outlineColor = lerp(outlineColor, ol, o.OutlineLightingMode);
                    FinalColor.rgb = outlineColor;
                #endif
            
                FinalColor.a = o.Alpha;
            
                // Premulty output by alpha for correct `Fade` mode
                #if defined(UNITY_PASS_FORWARDADD)
                if (_RenderType == 3)
                {
                    FinalColor.rgb *= o.Alpha;
                }
                #endif
            
                #endif
            }
            

            void VertexBase(inout VertexData v, inout FragmentData o)
            {
                #if defined(UNITY_PASS_META) && !defined(UNITY_PASS_BAKERY_META)
                o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
                #else
                o.pos = TransformObjectToHClip(v.vertex);
                #endif
                o.normal = v.normal;
                o.uv0 = v.uv0;
                o.uv1 = v.uv1;
                o.uv2 = v.uv2;
                o.uv3 = v.uv3;
                #if defined(NEED_UV4)
                o.uv4 = v.uv4;
                #endif
                #if defined(NEED_UV5)
                o.uv5 = v.uv5;
                #endif
                #if defined(NEED_UV6)
                o.uv6 = v.uv6;
                #endif
                #if defined(NEED_UV7)
                o.uv7 = v.uv7;
                #endif
                o.worldPos = mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1));
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldTangent.xyz = UnityObjectToWorldDir(v.tangent.xyz);
                o.worldTangent.w = v.tangent.w * unity_WorldTransformParams.w;
                o.vertexColor = v.color;
            
                #if defined(EDITOR_VISUALIZATION)
                o.vizUV = 0;
                o.lightCoord = 0;
                if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
                {
                    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.uv0.xy, v.uv1.xy, v.uv2.xy, unity_EditorViz_Texture_ST);
                }
                else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
                {
                    o.vizUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
                }
                #endif
            
                #if defined(NEED_SCREEN_POS)
                o.screenPos = GetScreenPosition(o.pos);
                o.screenPos.z = -TransformWorldToView(TransformObjectToWorld(v.vertex)).z;
                #endif
            
                #if !defined(UNITY_PASS_META)
                    #if defined(LIGHTMAP_ON)
                    o.lightmapUv.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    #endif
                    #if defined(DYNAMICLIGHTMAP_ON)
                    o.lightmapUv.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                    #endif
                        
                    UNITY_TRANSFER_LIGHTING(o, v.uv1.xy);
                    
                    #if !defined(UNITY_PASS_FORWARDADD)
                        // unity does some funky stuff for different platforms with these macros
                        #ifdef FOG_COMBINED_WITH_TSPACE
                            UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o, o.pos);
                        #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                            UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o, o.pos);
                        #else
                            UNITY_TRANSFER_FOG(o, o.pos);
                        #endif
                    #else
                        UNITY_TRANSFER_FOG(o, o.pos);
                    #endif
                #endif
            }
            

            // Free Functions

            // ForwardAdd Vertex
            #if !defined(TESS_ENABLED)
            FragmentData Vertex(VertexData v)
            {
                UNITY_SETUP_INSTANCE_ID(v);
                FragmentData o;
                UNITY_INITIALIZE_OUTPUT(FragmentData, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // ForwardAdd Vertex Chain
                VRCFeaturesVertex(v);

                ToonOutlineVertex(v);

                AudioLinkVertex(v);

                // ForwardAdd VertexBase
                VertexBase(v, o);

                return o;
            }
            #endif

            // ForwardAdd Fragment
            half4 Fragment(FragmentData i, bool facing: SV_IsFrontFace) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(i);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
                #ifdef FOG_COMBINED_WITH_TSPACE
                    UNITY_EXTRACT_FOG_FROM_TSPACE(i);
                #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                    UNITY_EXTRACT_FOG_FROM_WORLD_POS(i);
                #else
                    UNITY_EXTRACT_FOG(i);
                #endif

                SurfaceData o = CreateSurfaceData();
                MeshData d = CreateMeshData(i, facing);
                half4 FinalColor = 1;

                // ForwardAdd Fragment Chain
                ToonMainFragment(d, o, facing);

                ToonOcclusionFragment(d, o);

                ToonNormalsFragment(d, o);

                ToonOutlineFragment(d, o);

                ToonSpecularFragment(d, o);

                ToonReflectionFragment(d, o);

                ToonALFragment(d, o);

                ToonEmissionFragment(o);

                ToonRimLightFragment(d, o);

                ToonShadowRimFragment(d, o);

                ChromaFrag(d, o);

                LumaFrag(d, o);

                VideoFrag(d, o);

                CrowdwaveFrag(d, o);

                Toon_SheenFragment(d, o);

                // ForwardAdd FragmentBase
                XSToonLighting(d, i, o, FinalColor);

                // ForwardAdd Color Chain
                LTCGIColor(d, i, o, FinalColor, facing);

                // ForwardAdd PostVertex Chain

                UNITY_APPLY_FOG(_unity_fogCoord, FinalColor);

                return FinalColor;
            }

            ENDCG
            // ForwardAdd Pass End
        }

        Pass
        {
            Name "META"
            Tags { "LightMode" = "Meta"  }
            Cull Off

            // Meta Pass Start
            CGPROGRAM
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
            #pragma shader_feature EDITOR_VISUALISATION
            #pragma vertex Vertex
            #pragma fragment Fragment
            #pragma shader_feature_local_fragment _NATIVE_A2C
            
            #pragma shader_feature_local_fragment SEPARATE_ALPHA
            
            #pragma shader_feature _AUDIOLINKVERTEX
            
            #pragma shader_feature_local_fragment NORMALS_SET
            #pragma shader_feature_local_fragment DETAIL_NORMALS_SET
            
            #pragma shader_feature_local OUTLINE_ENABLED
            
            #pragma shader_feature_local_fragment SPECULAR_ON
            
            #pragma shader_feature_local_fragment REFLECTION_MODE_OFF REFLECTION_MODE_PBR REFLECTION_MODE_BAKED_CUBEMAP REFLECTION_MODE_MATCAP
            
            #pragma shader_feature_local_fragment AL_MODE_SINGLE_CHANNEL AL_MODE_PACKED_MAP AL_MODE_UV_BASED
            #if !defined(AL_MODE_SINGLE_CHANNEL) && !defined(AL_MODE_PACKED_MAP) && !defined(AL_MODE_UV_BASED)
                #define AL_MODE_NONE
            #endif
            
            #pragma shader_feature_local_fragment _EMISSION
            
            #pragma shader_feature_local_fragment RIMLIGHT_ON
            
            #pragma shader_feature_local_fragment RIMSHADOW_ON
            
            #pragma shader_feature _AUDIOLINKCHROMA
            #pragma shader_feature _CHROMAMAP
            
            #pragma shader_feature _LUMA
            #pragma shader_feature _LUMALEGACY
            #pragma shader_feature _LUMAMAP
            
            #pragma shader_feature _VIDEO
            #pragma shader_feature _VIDEOMAP
            #pragma shader_feature _VIDEOAST
            #pragma shader_feature _VIDEOALBEDO
            
            #pragma shader_feature _CROWDWAVE
            #pragma shader_feature _CROWDWAVERANGE
            
            #pragma shader_feature_local_fragment INTEGRATE_LTCGI
            
            #pragma shader_feature_local_vertex VRC_FEATURES
            
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_INSTANCED_LOD_FADE
            #define UNITY_INSTANCED_SH
            #define UNITY_INSTANCED_LIGHTMAPSTS

            #ifndef UNITY_PASS_META
                #define UNITY_PASS_META
            #endif

            #include "UnityPBSLighting.cginc"
            #include "UnityMetaPass.cginc"

            // ShaderDefines
            #define NEED_FRAGMENT_IN_SHADOW
            #define NEED_ALBEDO_ALPHA
            
            #define GLOBAL_UV_SET
            
            #define PIXEL_NORMAL_SET
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #if defined(INTEGRATE_LTCGI)
                #define _INTEGRATE_CUSTOMGI_FLEX
            #endif
            
            #define INCLUDE_LTCGI defined(INTEGRATE_LTCGI)
            
            #if INCLUDE_LTCGI
                #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI_structs.cginc"
            #endif
            
            #define ORL_LIGHTING_MODEL_TOON
            
            #if defined(UNITY_PBS_USE_BRDF2) || defined(SHADER_API_MOBILE)
                #define PLAT_QUEST
            #else
                #ifdef PLAT_QUEST
                    #undef PLAT_QUEST
                #endif
            #endif
            
            #define NEED_SCREEN_POS
            
            #define grayscaleVec float3(0.2125, 0.7154, 0.0721)
            // DataStructs
            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 color : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD7;
                #endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct FragmentData
            {
                #if defined(UNITY_PASS_SHADOWCASTER)
                V2F_SHADOW_CASTER;
                #else
                float4 pos : SV_POSITION;
                #endif
                    
                float3 normal : RAW_NORMAL;
                float4 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 uv2 : TEXCOORD3;
                float4 uv3 : TEXCOORD4;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD5;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD6;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD7;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD8;
                #endif
                float3 worldPos : WORLD_POS;
                float3 worldNormal : WORLD_NORMAL;
                float4 worldTangent : WORLD_TANGENT;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                float4 lightmapUv : LM_UV;
                #endif
                centroid float4 vertexColor : VERTEX_COLOR;
            
                #if !defined(UNITY_PASS_META)
                UNITY_LIGHTING_COORDS(9, 10)
                UNITY_FOG_COORDS(11)
                #endif
            
                #if defined(EDITOR_VISUALIZATION)
                float2 vizUV : VIZ_UV;
                float4 lightCoord : LIGHT_COORD;
                #endif
                  
                #if defined(NEED_SCREEN_POS)
                float4 screenPos: SCREENPOS;
                #endif
            
                #if defined(EXTRA_V2F_0)
                float4 extraV2F0 : EXTRA_V2F_BLOCK0;
                #endif
                #if defined(EXTRA_V2F_1)
                float4 extraV2F1 : EXTRA_V2F_BLOCK1;
                #endif
                #if defined(EXTRA_V2F_2)
                float4 extraV2F2 : EXTRA_V2F_BLOCK2;
                #endif
                #if defined(EXTRA_V2F_3)
                float4 extraV2F3 : EXTRA_V2F_BLOCK3;
                #endif
            
                // Additional Fragment Data
                
                // Additional Fragment Data End
            
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            struct LTCGIAccumulatorStruct {
                float3 diffuse;
                float3 specular;
            };
            
            #define LTCGI_V2_CUSTOM_INPUT LTCGIAccumulatorStruct
            
            struct MeshData
            {
                float4 uv0;
                float4 uv1;
                float4 uv2;
                float4 uv3;
                #if defined(NEED_UV4)
                float4 uv4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half4 lightmapUv;
                #endif
                half4 vertexColor;
                half3 normal;
                half3 worldNormal;
                half3 localSpacePosition;
                half3 worldSpacePosition;
                half3 worldSpaceViewDir;
                half3 worldSpaceTangent;
                half3 tangentSpaceViewDir;
                float3x3 TBNMatrix;
                half3 bitangent;
                half3 svdn;
                float4 extraV2F0;
                float4 extraV2F1;
                float4 extraV2F2;
                float4 extraV2F3;
                float4 screenPos;
            
                // Additional Mesh Data
                
                // Additional Mesh Data End
            };
            
            MeshData CreateMeshData(FragmentData i, bool facing)
            {
                MeshData d = (MeshData) 0;
                d.uv0 = i.uv0;
                d.uv1 = i.uv1;
                d.uv2 = i.uv2;
                d.uv3 = i.uv3;
                #if defined(NEED_UV4)
                d.uv4 = i.uv4;
                #endif
                #if defined(NEED_UV5)
                d.uv5 = i.uv5;
                #endif
                #if defined(NEED_UV6)
                d.uv6 = i.uv6;
                #endif
                #if defined(NEED_UV7)
                d.uv7 = i.uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.lightmapUv = i.lightmapUv;
                #endif
                d.worldNormal = normalize(i.worldNormal);
                d.localSpacePosition = mul(unity_WorldToObject, float4(i.worldPos, 1)).xyz;
                d.worldSpacePosition = i.worldPos;
                d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
            
                d.normal = i.normal;
                d.vertexColor = i.vertexColor;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.bitangent = normalize(cross(i.worldTangent.xyz, d.worldNormal) * i.worldTangent.w * - 1);
                d.worldSpaceTangent = normalize(i.worldTangent.xyz);
                d.TBNMatrix = float3x3(normalize(i.worldTangent.xyz), d.bitangent, d.worldNormal);
                d.TBNMatrix[2].xyz *= facing ? 1 : -1;
                d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
                #endif
            
                #if UNITY_SINGLE_PASS_STEREO
                half3 stereoCameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
                d.svdn = normalize(stereoCameraPos - d.worldSpacePosition);
                #else
                d.svdn = d.worldSpaceViewDir;
                #endif
            
                #if defined(EXTRA_V2F_0)
                d.extraV2F0 = i.extraV2F0;
                #endif
                #if defined(EXTRA_V2F_1)
                d.extraV2F1 = i.extraV2F1;
                #endif
                #if defined(EXTRA_V2F_2)
                d.extraV2F2 = i.extraV2F2;
                #endif
                #if defined(EXTRA_V2F_3)
                d.extraV2F3 = i.extraV2F3;
                #endif
                #if defined(NEED_SCREEN_POS)
                d.screenPos = i.screenPos;
                #endif
            
                // Additional Mesh Data Creator
                
                // Additional Mesh Data Creator End
            
                return d;
            }
            
            struct SurfaceData
            {
                half3 Albedo;
                half Alpha;
                half Hue;
                half Saturation;
                half Value;
                    
                half Metallic;
                half Smoothness;
                half Anisotropy;
                half3 Normal;
                    
                half Occlusion;
                int OcclusionMode;
            
                half3 Emission;
                int EmissionScaleWithLight;
                half EmissionLightThreshold;
                    
                half ShadowSharpness;
                    
                half4 RimLight;
                half RimAttenuation;
                half4 RimShadow;
                    
                half SpecularIntensity;
                half SpecularArea;
                half SpecularAlbedoTint;
                half SpecularAnisotropy;
                half SpecularSharpness;
                    
                half Reflectivity;
                half3 BakedReflection;
                half ReflectionBlendMode;
                    
                half3 OutlineColor;
                int OutlineLightingMode;
            
                // Additional Surface Data
                
                // Additional Surface Data End
            };
            
            SurfaceData CreateSurfaceData()
            {
                SurfaceData o = (SurfaceData) 0;
                o.Albedo = 0.5;
                o.Occlusion = 1;
                o.Normal = half3(0, 0, 1);
                o.Smoothness = 0.5;
                o.Alpha = 1;
                o.RimShadow = 1;
                o.RimAttenuation = 1;
                return o;
            }
            // GlobalVariables

            // Variables
            float4 _MainTex_ST;
            int _MainTexUVSet;
            int _TintByVertexColor;
            half4 _Color;
            half4 _BackfaceColor;
            half _BackfaceAlbedoTint;
            half _AlphaScale;
            half _Hue;
            half _Saturation;
            half _Value;
            half _ShadowSharpness;
            half2 GLOBAL_uv;
            int _OcclusionMode;
            half _OcclusionStrength;
            int _OcclusionTilingMode;
            half _OcclusionTiling;
            int _OcclusionDetailEnabled;
            half _OcclusionDetailStrength;
            int _OcclusionDetailTilingMode;
            half _OcclusionDetailTiling;
            #if defined(_AUDIOLINKVERTEX)
                uniform int _EnableAudioLinkVertex;
            #endif
            uniform fixed4 _AudioLinkVertexMap_ST;
            uniform half _AudioLinkVertexHistory;
            uniform int _AudioLinkVertexBand;
            uniform half _AudioLinkVertexIntensity;
            int _BumpMapTilingMode;
            float _BumpMapTiling;
            half _BumpScale;
            int _FlipBumpY;
            int _NormalBicubicSampling;
            half4 _DetailNormalMap_ST;
            int _DetailNormalsUVSet;
            half _DetailNormalTiling;
            half _DetailNormalScale;
            half _FlipDetailNormalY;
            int _DetailNormalMaskUVSet;
            half _DetailNormalMaskTiling;
            half3 GLOBAL_pixelNormal;
            int _StencilBasePass;
            int _StencilBaseComp;
            int _StencilOutlineComp;
            half4 _OutlineColor;
            int _OutlineLightingMode;
            half _OutlineAlbedoTint;
            half4 _OutlineMask_ST;
            half _OutlineWidth;
            int _OutlineWidthAdjustByVertexColor;
            int _SpecularMapUVSet;
            int _SpecularTilingMode;
            half _SpecularTiling;
            half _SpecularIntensity;
            half _SpecularRoughness;
            half _SpecularSharpness;
            half _SpecularAnisotropy;
            half _SpecularAlbedoTint;
            int _SpecularMaskTilingMode;
            half _SpecularMaskTiling;
            half _SpecularMaskStrength;
            int _ReflectionMode;
            half _ReflectionBlendMode;
            half _Smoothness;
            half _Metallic;
            int _RoughnessMode;
            int _MetallicGlossMapTilingMode;
            half _MetallicGlossMapTiling;
            half4 _MetallicRemap;
            half4 _SmoothnessRemap;
            half4 _MetallicGlossMap_TexelSize;
            half _ReflectionAnisotropy;
            half _MatcapBlur;
            half _MatcapTintToDiffuse;
            int _ReflectivityMaskTilingMode;
            half _ReflectivityMaskTiling;
            half _ReflectivityLevel;
            int _ALBand;
            half4 _ALEmissionColor;
            int _ALEmissionDotMask;
            int _ALEmissionDotMaskInvert;
            half _ALEmissionDotMaskSmoothing;
            int _ALGradientOnRed;
            int _ALGradientOnGreen;
            int _ALGradientOnBlue;
            half4 _ALPackedRedColor;
            half4 _ALPackedGreenColor;
            half4 _ALPackedBlueColor;
            int _ALSmoothingLevel;
            int _ALUVWidth;
            int _ALMapUVSet;
            half4 _EmissionColor;
            half _EmissionTintToDiffuse;
            int _EmissionScaleWithLight;
            half _EmissionScaleWithLightSensitivity;
            half4 _RimTint;
            half _RimIntensity;
            half _RimAlbedoTint;
            half _RimEnvironmentTint;
            half _RimAttenuation;
            half _RimRange;
            half _RimThreshold;
            half _RimSharpness;
            half4 _ShadowRimTint;
            half _ShadowRimRange;
            half _ShadowRimThreshold;
            half _ShadowRimSharpness;
            half _ShadowRimAlbedoTint;
            #if defined(_AUDIOLINKCHROMA)
                uniform int _EnableAudioLinkChroma;
            #endif
            uniform float4 _ChromaMask_ST;
            uniform fixed4 _ChromaTint;
            uniform int _ChromaForceIdle;
            uniform int _ChromaModeR;
            uniform int _ChromaModeG;
            uniform int _ChromaModeB;
            uniform fixed _ChromaHistory;
            uniform half _ChromaWarp;
            uniform half _ChromaSpeed;
            uniform half _ChromaBiased;
            uniform int _ChromaForceTheme;
            uniform fixed4 _ChromaTheme0;
            uniform fixed4 _ChromaTheme1;
            uniform fixed4 _ChromaTheme2;
            uniform fixed4 _ChromaTheme3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
                uniform int _ReactPriority;
            #endif
            #if !defined(_CHROMAMAP)
                uniform int _ChromaBand;
                uniform fixed _ChromaRotation;
            #endif
            #if defined(_LUMA)
                uniform int _EnableLuma;
            #endif
            #if defined(_LUMALEGACY)
                uniform fixed4 _Stored_TexelSize;
                const static int GRADSTART[3] = { LUMA_LEGACY_GRAD_START1, LUMA_LEGACY_GRAD_START2, LUMA_LEGACY_GRAD_START3 };
            #endif
            uniform float4 _LumaMask_ST;
            uniform fixed4 _LumaTint;
            uniform half _LumaWarp;
            uniform half _LumaBiased;
            uniform int _LumaGrad1;
            uniform int _LumaGrad2;
            uniform int _LumaGrad3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
            #endif
            #if !defined(_LUMAMAP)
                uniform fixed _LumaRotation;
            #endif
            #if defined(_VIDEO)
                uniform int _EnableVideo;
            #endif
            #ifndef _UDON_VIDEOTEX_ST
                #define _UDON_VIDEOTEX_ST
                uniform float4 _Udon_VideoTex_ST;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
                uniform float4 _Udon_VideoTex_TexelSize;
            #endif
            uniform fixed4 _VideoTint;
            uniform float4 _VideoMask_ST;
            #if !defined(_VIDEOMAP)
                uniform fixed _VideoRatio;
                uniform fixed _VideoRotation;
            #endif
            #if defined(_CROWDWAVE)
                uniform int _EnableCrowdwave;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
            #endif
            uniform fixed4 _CrowdwaveTint;
            uniform half _CrowdwaveBias;
            uniform float4 _CrowdwaveMask_ST;
            uniform float4x4 _Udon_CrowdwaveMeta;
            int _LTCGIEnableOnMobile;
            int _LTCGIClampBrightness;
            half _LTCGIMaxBrightness;
            half _LTCGIDiffuseIntensity;
            half _LTCGISpecularIntensity;
            half _LTCGIRoughnessModifier;
            int _LTCGIAlphaPremultiply;
            half _SheenStrength;
            half _SheenPower;
            half4 _SheenTint;
            half _SheenAlbedoTint;
            int _SheenBlendType;
            half4 _SheenMask_ST;
            int _VRCHideInVR;
            int _VRCHideInDesktop;
            int _VRCHideInVRCamera;
            int _VRCHideInDesktopCamera;
            int _VRCHideInVRMirror;
            int _VRCHideInDesktopMirror;
            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            int _IgnoreLightprobeNormal;
            int _MinLight;
            half _MonochromeLighting;
            int _RenderType;
            half _Cutoff;

            // Textures
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            #if defined(SEPARATE_ALPHA)
            TEXTURE2D(_AlphaTex);
            #endif
            TEXTURE2D(_OcclusionMap);
            TEXTURE2D(_OcclusionDetail);
            TEXTURE2D(_AudioLinkVertexMap);
            SAMPLER(sampler_AudioLinkVertexMap);
            TEXTURE2D(_BumpMap);
            SAMPLER(sampler_BumpMap);
            TEXTURE2D(_DetailNormalMap);
            SAMPLER(sampler_DetailNormalMap);
            TEXTURE2D(_DetailNormalMask);
            SAMPLER(sampler_DetailNormalMask);
            TEXTURE2D(_OutlineTex);
            TEXTURE2D(_OutlineMask);
            SAMPLER(sampler_OutlineTex);
            SAMPLER(sampler_OutlineMask);
            TEXTURE2D(_SpecularMap);
            TEXTURE2D(_SpecularMask);
            TEXTURE2D(_Matcap);
            SAMPLER(sampler_Matcap);
            TEXTURE2D(_MetallicGlossMap);
            TEXTURE2D(_ReflectivityMask);
            TEXTURE2D(_ALMap);
            SAMPLER(sampler_ALMap);
            TEXTURE2D(_EmissionMap);
            TEXTURE2D(_ChromaMask);
            #if defined(_CHROMAMAP)
                TEXTURE2D(_ChromaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                    TEXTURE2D(_Stored);
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
                SAMPLER(bilinear_clamp);
            #endif
            TEXTURE2D(_LumaMask);
            #if defined(_LUMAMAP)
                TEXTURE2D(_LumaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef POINT_CLAMP
                #define POINT_CLAMP
                SAMPLER(point_clamp);
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
                TEXTURE2D(_Udon_VideoTex);
            #endif
            TEXTURE2D(_VideoMask);
            TEXTURE2D(_VideoFallback);
            #if defined(_VIDEOMAP)
                TEXTURE2D(_VideoMap);
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
            #endif
            TEXTURE2D(_Udon_CrowdwaveMask);
            TEXTURE2D(_CrowdwaveMask);
            SAMPLER(sampler_Udon_CrowdwaveMask);
            SAMPLER(sampler_CrowdwaveMask);
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            TEXTURE2D(_LTCGIRamp);
            SAMPLER(sampler_LTCGIRamp);
            TEXTURE2D(_SheenMask);
            SAMPLER(sampler_SheenMask);
            TEXTURE2D(_Ramp);
            SAMPLER(sampler_Ramp);
            TEXTURECUBE(_BakedCubemap);
            SAMPLER(sampler_BakedCubemap);

            // PassFunctions
            #if INCLUDE_LTCGI
            
            void LTCGICallbackDiffuse(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.diffuse += output.intensity * output.color;
            }
            
            void LTCGICallbackSpecular(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.specular += output.intensity * output.color;
            }    
            
            #define LTCGI_V2_DIFFUSE_CALLBACK LTCGICallbackDiffuse
            #define LTCGI_V2_SPECULAR_CALLBACK LTCGICallbackSpecular
                
            #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI.cginc"
            #endif

            // Functions
            void ToonMainFragment(MeshData d, inout SurfaceData o, bool facing)
            {
                half2 uv = 0;
                switch (_MainTexUVSet) {
                    case 0: uv = d.uv0; break;
                    case 1: uv = d.uv1; break;
                    case 2: uv = d.uv2; break;
                    case 3: uv = d.uv3; break;
                }
                uv = uv * _MainTex_ST.xy + _MainTex_ST.zw;
                GLOBAL_uv = uv;
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, GLOBAL_uv);
                if (facing) {
                    albedo *= _Color;
                } else {
                    albedo = lerp(_BackfaceColor, albedo * _BackfaceColor, _BackfaceAlbedoTint);
                }
                half3 albedoHSV = RGB2HSV(albedo.rgb);
            
                albedoHSV.x = fmod(albedoHSV.x + _Hue, 1);
                albedoHSV.y = saturate(albedoHSV.y + _Saturation);
                albedoHSV.z = saturate(albedoHSV.z + _Value);
                albedo.rgb = HSV2RGB(albedoHSV);
            
                o.Hue = _Hue;
                o.Saturation = _Saturation;
                o.Value = _Value;
                    
                if (_TintByVertexColor) {
                    albedo.rgb *= d.vertexColor.rgb;
                }
                o.Albedo = albedo.rgb;
                #if defined(NEED_ALBEDO_ALPHA)
                {
                    #if defined(SEPARATE_ALPHA) 
                    o.Alpha = saturate(SAMPLE_TEXTURE2D(_AlphaTex, sampler_MainTex, GLOBAL_uv).r * _AlphaScale);
                    #else
                    o.Alpha = saturate(albedo.a * _AlphaScale);
                    #endif
                }
                #else
                o.Alpha = 1;
                #endif
                o.ShadowSharpness = _ShadowSharpness;
            }
            

            void ToonOcclusionFragment(MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half occlusion = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_MainTex, lerp(globalUv * _OcclusionTiling, d.uv0 * _OcclusionTiling, _OcclusionTilingMode)).r;
                o.Occlusion = lerp(1, occlusion, _OcclusionStrength);
                    
                if (_OcclusionDetailEnabled) {
                    half occlusionDetail = SAMPLE_TEXTURE2D(_OcclusionDetail, sampler_MainTex, lerp(globalUv * _OcclusionDetailTiling, d.uv0 * _OcclusionDetailTiling, _OcclusionDetailTilingMode)).r;
                    o.Occlusion *= lerp(1, occlusionDetail, _OcclusionDetailStrength);
                }
            
                o.OcclusionMode = _OcclusionMode;
            }
            

            
                float4 QuanternionMultiply(float4 a, float4 b)
                {
            
                    return float4(a.w * b.xyz + b.w * a.xyz + cross(a.xyz, b.xyz), a.w * b.w - dot(a.xyz, b.xyz));
                }
            
                float3 QuanternionRotate(float3 pos, float3 vec, float rotate)
                {
            
                    rotate /= 2.0;
            
                    float4 quat1 = float4(vec.xyz, cos(rotate));
                    quat1.xyz *= sin(rotate);
            
                    float4 quat2 = float4(-quat1.x, -quat1.y, -quat1.z, quat1.w);
            
                    float4 mulpos = (quat1 * float4(pos, 0.0)) * quat2;
                    mulpos = QuanternionMultiply(QuanternionMultiply(quat1, float4(pos, 0.0)), quat2);
            
                    return mulpos;
            
                }
            
                void AudioLinkVertex(inout VertexData v)
                {
                    #if defined(_AUDIOLINKVERTEX)
            
                        if (!_EnableAudioLinkVertex) return;
            
                        half2 map = _AudioLinkVertexMap.SampleLevel(sampler_AudioLinkVertexMap, TRANSFORM_TEX(v.uv0.xy, _AudioLinkVertexMap), 0).rg;
                        half value = AudioLinkIsAvailable() ? AudioLinkLerp(float2(map.g * _AudioLinkVertexHistory, _AudioLinkVertexBand)).r * _AudioLinkVertexIntensity : 0.0;
            
                        v.vertex.xyz += v.normal.xyz * value * map.r;
            
                    #endif
                }
            

            void ToonNormalsFragment(inout MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                #if defined(NORMALS_SET)
                float4 normalTex = 0;
                if (_NormalBicubicSampling) {
                    normalTex = tex2DFastBicubicSampleNoChecks(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                } else {
                    normalTex = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                }
                if (_FlipBumpY)
                {
                    normalTex.y = 1 - normalTex.y;
                }
                half3 normal = UnpackNormalScale(normalTex, _BumpScale);
            
                o.Normal = BlendNormals(o.Normal, normal);
                #endif
                    
                #if defined(DETAIL_NORMALS_SET)
                    
                half2 detailUV = 0;
                switch (_DetailNormalsUVSet) {
                    case 0: detailUV = d.uv0; break;
                    case 1: detailUV = d.uv1; break;
                    case 2: detailUV = d.uv2; break;
                    case 3: detailUV = d.uv3; break;
                }
                detailUV = detailUV * _DetailNormalTiling;
                half4 detailNormalTex = SAMPLE_TEXTURE2D(_DetailNormalMap, sampler_DetailNormalMap, detailUV);
                if (_FlipDetailNormalY)
                {
                    detailNormalTex.y = 1 - detailNormalTex.y;
                }
            
                half2 detailMaskUV = 0;
                switch (_DetailNormalMaskUVSet) {
                    case 0: detailMaskUV = d.uv0; break;
                    case 1: detailMaskUV = d.uv1; break;
                    case 2: detailMaskUV = d.uv2; break;
                    case 3: detailMaskUV = d.uv3; break;
                }
                detailMaskUV *= _DetailNormalMaskTiling;
                half detailMask = SAMPLE_TEXTURE2D(_DetailNormalMask, sampler_DetailNormalMask, detailMaskUV).r;
            
                half3 detailNormal = UnpackNormalScale(detailNormalTex, _DetailNormalScale);
                    
                o.Normal = lerp(o.Normal, BlendNormals(o.Normal, detailNormal), detailMask);
            
                #endif
            
                #if defined(NORMALS_SET) || defined(DETAIL_NORMALS_SET)
            
                half3 properNormal = normalize(mul(o.Normal, d.TBNMatrix));
                d.worldSpaceTangent.xyz = cross(d.bitangent.xyz, properNormal);
                d.bitangent.xyz = cross(properNormal, d.worldSpaceTangent.xyz);
                d.TBNMatrix = float3x3(normalize(d.worldSpaceTangent.xyz), d.bitangent, d.worldNormal);
                GLOBAL_pixelNormal = properNormal;
            
                #else
            
                GLOBAL_pixelNormal = normalize(mul(o.Normal, d.TBNMatrix));
            
                #endif
            }
            

            void ToonOutlineVertex(inout VertexData v) {
                #if defined(PASS_OUTLINE)
                half mask = SAMPLE_TEXTURE2D_LOD(_OutlineMask, sampler_OutlineMask, TRANSFORM_TEX(v.uv0, _OutlineMask), 0);
                half3 width = mask * _OutlineWidth * .01;
                width *= min(distance(TransformObjectToWorld(v.vertex.xyz), _WorldSpaceCameraPos) * 3, 1);
                v.vertex.xyz += v.normal.xyz * lerp(width, width * v.color.r, _OutlineWidthAdjustByVertexColor);
                    
                #endif
            }
            

            void ToonOutlineFragment(MeshData d, inout SurfaceData o) {
                half3 outline = SAMPLE_TEXTURE2D(_OutlineTex, sampler_OutlineTex, d.uv0).rgb;
                o.OutlineColor = lerp(_OutlineColor * outline, _OutlineColor * outline * o.Albedo, _OutlineAlbedoTint);
                o.OutlineLightingMode = _OutlineLightingMode;
            }
            

            void ToonSpecularFragment(MeshData d, inout SurfaceData o) {
                #if defined(SPECULAR_ON)
                    
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half2 specularUv = lerp(globalUv * _SpecularTiling, d.uv0 * _SpecularTiling, _SpecularTilingMode);
                half2 specularMaskUv = lerp(globalUv * _SpecularMaskTiling, d.uv0 * _SpecularMaskTiling, _SpecularMaskTilingMode);
            
                half3 specMap = SAMPLE_TEXTURE2D(_SpecularMap, sampler_MainTex, specularUv);
                o.SpecularIntensity = max(0, _SpecularIntensity * specMap.r);
                o.SpecularArea = max(0.01, GSAA_Filament(d.worldNormal, _SpecularRoughness, 0.05, 0.1) * specMap.b);
                o.SpecularAnisotropy = _SpecularAnisotropy;
                o.SpecularAlbedoTint = _SpecularAlbedoTint * specMap.g;
                o.SpecularSharpness = _SpecularSharpness;
                o.SpecularArea = lerp(o.SpecularArea, o.SpecularArea * SAMPLE_TEXTURE2D(_SpecularMask, sampler_MainTex, specularMaskUv).r, _SpecularMaskStrength);
                #endif
            }
            

            void ToonReflectionFragment(MeshData d, inout SurfaceData o) {
                #if defined(REFLECTION_MODE_OFF)
                return;
                #endif
            
                o.ReflectionBlendMode = _ReflectionBlendMode;
            
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half mask = SAMPLE_TEXTURE2D(_ReflectivityMask, sampler_MainTex, lerp(globalUv * _ReflectivityMaskTiling, d.uv0 * _ReflectivityMaskTiling, _ReflectivityMaskTilingMode)).r;
                mask *= _ReflectivityLevel;
                    
                #if defined(REFLECTION_MODE_PBR) || defined(REFLECTION_MODE_BAKED_CUBEMAP)
                        
                half4 metalSmooth = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MainTex, lerp(globalUv * _MetallicGlossMapTiling, d.uv0 * _MetallicGlossMapTiling, _MetallicGlossMapTilingMode));
                int hasMetallicSmooth = _MetallicGlossMap_TexelSize.z > 8;
                half metal = metalSmooth.r;
                half smooth = metalSmooth.a;
                if (_RoughnessMode)
                {
                    smooth = 1 - smooth;
                }
                metal = remap(metal, 0, 1, _MetallicRemap.x, _MetallicRemap.y);
                smooth = remap(smooth, 0, 1, _SmoothnessRemap.x, _SmoothnessRemap.y);
                o.Metallic = lerp(_Metallic, metal, hasMetallicSmooth);
                o.Smoothness = lerp(_Smoothness, smooth, hasMetallicSmooth);
                o.Anisotropy = _ReflectionAnisotropy;
                    
                #elif defined(REFLECTION_MODE_MATCAP)
                    
                half3 upVector = half3(0,1,0);
                half2 remapUV = calcMatcapUV(upVector, d.worldSpaceViewDir, GLOBAL_pixelNormal);
                half4 spec = 0; 
                spec = SAMPLE_TEXTURE2D_LOD(_Matcap, sampler_Matcap, remapUV, _MatcapBlur * UNITY_SPECCUBE_LOD_STEPS);
            
                spec.rgb *= lerp(1, o.Albedo, _MatcapTintToDiffuse);
                o.BakedReflection = spec.rgb;
                    
                #endif
            
                o.Reflectivity = mask;
            }
            

            void ToonALFragment(MeshData d, inout SurfaceData o) {
                #if defined(AL_MODE_NONE)
                    return;
                #else
            
                if(AudioLinkIsAvailable()) {
                    half2 alUV = 0;
            
                    half2 globalUv = 0;
            
                    #if defined(GLOBAL_UV_SET)
                    globalUv = GLOBAL_uv;
                    #else
                    globalUv = d.uv0;
                    #endif
            
                    switch (_ALMapUVSet) {
                        case 0: alUV = globalUv; break;
                        case 1: alUV = d.uv1; break;
                        case 2: alUV = d.uv2; break;
                        case 3: alUV = d.uv3; break;
                    }
                    half4 alMask = SAMPLE_TEXTURE2D(_ALMap, sampler_ALMap, alUV);
            
                    #if defined(AL_MODE_SINGLE_CHANNEL)
            
                    half sampledAL = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        sampledAL = AudioLinkData(int2(0, _ALBand)).x;
                    } else {
                        sampledAL = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel, _ALBand)).x;
                    }
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
            
                    #elif defined(AL_MODE_PACKED_MAP)
            
                    half audioDataBass = 0;
                    half audioDataMids = 0;
                    half audioDataHighs = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        audioDataBass = AudioLinkData(ALPASS_AUDIOBASS).x;
                        audioDataMids = AudioLinkData(ALPASS_AUDIOLOWMIDS).x;
                        audioDataHighs = (AudioLinkData(ALPASS_AUDIOHIGHMIDS).x + AudioLinkData(ALPASS_AUDIOTREBLE).x) * 0.5;
                    } else {
                        audioDataBass = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,0)).x;
                        audioDataMids = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,1)).x;
                        audioDataHighs = (AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,2)).x + AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,3)).x) * 0.5;
                    }
            
                    audioDataMids = clamp(audioDataMids, 0, 0.98);
            
                    half tLow = smoothstep((1-audioDataBass), (1-audioDataBass) + 0.01, alMask.r) * alMask.a;
                    half tMid = smoothstep((1-audioDataMids), (1-audioDataMids) + 0.01, alMask.g) * alMask.a;
                    half tHigh = smoothstep((1-audioDataHighs), (1-audioDataHighs) + 0.01, alMask.b) * alMask.a;
            
                    half4 emissionChannelRed = lerp(alMask.r, tLow, _ALGradientOnRed) * _ALPackedRedColor * audioDataBass;
                    half4 emissionChannelGreen = lerp(alMask.g, tMid, _ALGradientOnGreen) * _ALPackedGreenColor * audioDataMids;
                    half4 emissionChannelBlue = lerp(alMask.b, tHigh, _ALGradientOnBlue) * _ALPackedBlueColor * audioDataHighs;
                    half3 em = emissionChannelRed.rgb + emissionChannelGreen.rgb + emissionChannelBlue.rgb;
                    
                    #elif defined(AL_MODE_UV_BASED)
            
                    half2 aluv;
                    aluv = half2(alUV.x * _ALUVWidth, alUV.y);
                    half sampledAL = AudioLinkLerp(aluv).x;
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
                        
                    #else
                    half3 em = 0;
                    #endif
            
                    half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                    NoV = lerp(NoV, 1 - NoV, _ALEmissionDotMaskInvert);
                    NoV = saturate(pow(NoV, _ALEmissionDotMaskSmoothing));
                    o.Emission += lerp(em, em * NoV, _ALEmissionDotMask);
                }
            
                #endif
            }
            

            void ToonEmissionFragment(inout SurfaceData o) {
                #if defined(_EMISSION)
                half3 emission = SAMPLE_TEXTURE2D(_EmissionMap, sampler_MainTex, GLOBAL_uv).rgb;
                emission *= lerp(emission, emission * o.Albedo, _EmissionTintToDiffuse) * _EmissionColor;
                o.Emission += emission;
                #endif
                o.EmissionScaleWithLight = _EmissionScaleWithLight;
                o.EmissionLightThreshold = _EmissionScaleWithLightSensitivity;
            }
            

            void ToonRimLightFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMLIGHT_ON)
                    
                #ifndef USING_DIRECTIONAL_LIGHT
                    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(d.worldSpacePosition));
                #else
                    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
            
                half3 normal = 0;
                #if defined(PIXEL_NORMAL_SET)
                normal = GLOBAL_pixelNormal;
                #else
                normal = o.Normal;
                #endif
            
                half lightNoL = saturate(dot(normal, lightDir));
                half SVDNoN = abs(dot(d.svdn, normal));
            
                half rimIntensity = saturate((1 - SVDNoN)) * saturate(pow(lightNoL, _RimThreshold));
                rimIntensity = smoothstep(_RimRange - _RimSharpness, _RimRange + _RimSharpness, rimIntensity);
                half4 rim = rimIntensity * _RimIntensity;
            
                // Rim Light Env Tint
                half3 env = 0;
                #if defined(UNITY_PASS_FORWARDBASE)
                    env = getEnvReflection(d.worldSpaceViewDir.xyz, d.worldSpacePosition.xyz, normal, o.Smoothness, 5);
                #endif
                    
                o.RimLight = rim * _RimTint * lerp(1, half4(o.Albedo.rgb,1), _RimAlbedoTint) * lerp(1, half4(env.rgb,1), _RimEnvironmentTint);
                o.RimLight *= _RimTint.a;
                o.RimAttenuation = _RimAttenuation;
                    
                #endif
            }
            

            void ToonShadowRimFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMSHADOW_ON)
            
                Light mainLight = GetMainLight(0..xxxx, d.worldSpacePosition, 0..xxxx);
            
                float3 lightDir = mainLight.direction;
                    
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
                half lightNoL = saturate(dot(GLOBAL_pixelNormal, lightDir));
                half SVDNoN = abs(dot(d.svdn, GLOBAL_pixelNormal));
                half shadowRimIntensity = saturate((1 - SVDNoN)) * pow(1 - lightNoL, _ShadowRimThreshold * 2);
                shadowRimIntensity = smoothstep(_ShadowRimRange - _ShadowRimSharpness, _ShadowRimRange + _ShadowRimSharpness, shadowRimIntensity);
            
                o.RimShadow = lerp(1, (_ShadowRimTint * lerp(1, o.Albedo.rgbb, _ShadowRimAlbedoTint)), shadowRimIntensity);
            
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
                #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            bool ShouldReact() { return AudioLinkIsAvailable() && !_ChromaForceIdle; }
            
            float ChronoTime(int band)
            {
                if (ShouldReact()) return AudioLinkGetChronoTime(0, band);
                return _Time.x;
            }
            
            fixed3 ThemeColor(int theme)
            {
                theme %= 4;
                if (ShouldReact() && !_ChromaForceTheme)
                {
                    return AudioLinkData(ALPASS_THEME_COLOR0 + int2(theme, 0));
                } else switch (theme) {
                    case 0:
                        return _ChromaTheme0;
            
                    case 1:
                        return _ChromaTheme1;
            
                    case 2:
                        return _ChromaTheme2;
            
                    case 3:
                        return _ChromaTheme3;
            
                    default:
                        return 0.0;
                }
            }
            
            // float3 ThemeHue(float value)
            // {
            //     float scaledTime = value * 4.0;
            //     return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime));
            // }
            
            fixed3 ChromaEffect(int effect, int band, float progress, float value)
            {
                fixed dft = 0.0;
                if (effect > 8)
                    if (ShouldReact())
                    {
                        dft = AudioLinkLerpMultiline(ALPASS_DFT + float2(progress * AUDIOLINK_ETOTALBINS, 0.0)).g * 0.9;
                    } else
                        dft = (_Time.x * _ChromaSpeed) - progress;
            
                switch (effect)
                {
                    case 1: // Color Theme 1 to Color Theme 2
                        return lerp(ThemeColor(0), ThemeColor(1), progress) * value;
            
                    case 2: // Color Theme 3 to Color Theme 4
                        return lerp(ThemeColor(2), ThemeColor(3), progress) * value;
            
                    case 3: // Color Themes 1 - 4
                        float scaledTime = progress * 3.0;
                        return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime)) * value;
            
                    case 4: // Solid Hue Chronotensity
                        return HSV2RGB(float3(ChronoTime(band) * _ChromaSpeed, 1.0, value));
            
                    case 5: // Hue Value
                        return HSV2RGB(float3(ShouldReact() ? value : (_Time.x + .5 * _ChromaSpeed), 1.0, value));
            
                    case 6: // Hue Time Gradient
                        return HSV2RGB(float3((_Time.x * 2.0 * _ChromaSpeed) - progress, 1.0, value));
            
                    case 7: // Hue Time Gradient + Time Pulse Gradient
                        return HSV2RGB(float3(((_Time.y / 5.0) * _ChromaSpeed) - progress, 1.0, value * abs(sin((_Time.y * _ChromaSpeed) - (progress * 15.0)))));
            
                    case 8: // Hue Chronotensity Gradient
                        return HSV2RGB(float3((((ChronoTime(band) * _ChromaSpeed) + AudioLinkGetChronoTime(4, band)) * 0.33) - progress, 1.0, value));
            
                    case 9: // Waveform Hue
                        return HSV2RGB(float3(dft, 1.0, value));
            
                    case 10: // Warped Waveform Hue
                        return HSV2RGB(float3((sin((dft - progress) * UNITY_PI) + 1.0) / 2.0, 1.0, value));
            
                    default:
                        return 0.0;
                }
            }
            
            void ChromaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_AUDIOLINKCHROMA)
            
                    if (!_EnableAudioLinkChroma) return;
            
                    #if defined(_LUMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (!_ReactPriority) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _ChromaMask);
            
                    fixed4 mask = _ChromaMask.Sample(bilinear_clamp, uv);
                    #if defined(_CHROMAMAP)
                        fixed4 map = _ChromaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
            
                        int band = floor(clamp(mask.a * 4.0, 0.0, 3.99));
                    #else
                        uv = rotate(uv - 0.5, _ChromaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, clamp(uv.x, 0.0, 1.0));
            
                        int band = _ChromaBand;
                    #endif
                    map.a = pow(map.a, _ChromaWarp);
            
                    fixed value = 1.0;
                    if (ShouldReact()) value = AudioLinkLerp(float2(map.a * _ChromaHistory, band)).r;
            
                    fixed3 color = 0.0;
                    color += ChromaEffect(_ChromaModeR, band, map.a, value) * map.r;
                    #if defined(_CHROMAMAP)
                        color += ChromaEffect(_ChromaModeG, band, map.a, value) * map.g;
                        color += ChromaEffect(_ChromaModeB, band, map.a, value) * map.b;
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.114)), _ChromaBiased) * _ChromaTint * mask.rgb;
            
                    o.Emission += color;
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            fixed3 LumaGradient(int grad, fixed prog)
            {
                return AudioLinkLerp(float2(prog * 127.0, LUMA_START - (grad % LUMA_POWER)));
            }
            
            fixed3 LumaLegacyGradient(int grad, fixed prog)
            {
                #if defined(_LUMALEGACY)
                    if (grad < 4)
                    {
                        fixed2 theme = fixed2((grad / 2) * LUMA_LEGACY_THEME_SIZE, -(grad % 2) * LUMA_LEGACY_THEME_SIZE);
                        return _Stored.SampleLevel(bilinear_clamp, (LUMA_LEGACY_THEME_POSITION + theme) / LUMA_LEGACY_SIZE, 0);
                    } else {
                        prog = GRADSTART[grad - 4] + (LUMA_LEGACY_LENGTH * prog);
                        return _Stored.SampleLevel(bilinear_clamp, fixed2(prog, LUMA_LEGACY_Y) / LUMA_LEGACY_SIZE, 0);
                    }
                #endif
            
                return 0.0;
            }
            
            void LumaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_LUMA)
            
                    if (!_EnableLuma) return;
            
                    #if defined(_AUDIOLINKCHROMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (_ReactPriority) return;
                    #endif
            
                    #if defined(_LUMALEGACY)
                        if (!IsLumaAvailable() && !IsLumaLegacyAvailable()) return;
                    #else
                        if (!IsLumaAvailable()) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _LumaMask);
            
                    fixed4 mask = _LumaMask.Sample(bilinear_clamp, uv);
                    #if defined(_LUMAMAP)
                        fixed4 map = _LumaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
                    #else
                        uv = rotate(uv - 0.5, _LumaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, uv.x);
                    #endif
            
                    map.a = pow(map.a, _LumaWarp);
                    fixed3 color = 0.0;
            
                    #if defined(_LUMALEGACY)
                        if (IsLumaAvailable())
                        {
                            color += LumaGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        } else {
                            map.a = 1.0 - map.a;
                            color += LumaLegacyGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaLegacyGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaLegacyGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        }
                    #else
                        color += LumaGradient(_LumaGrad1, map.a) * map.r;
                        #if defined(_LUMAMAP)
                            color += LumaGradient(_LumaGrad2, map.a) * map.g;
                            color += LumaGradient(_LumaGrad3, map.a) * map.b;
                        #endif
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _LumaBiased) * _LumaTint * mask.rgb;
            
                    o.Emission += color;
            
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            void VideoFrag(MeshData d, inout SurfaceData o) {
            
                #if defined(_VIDEO)
                    if (!_EnableVideo) return;
            
                    float2 videouv = TRANSFORM_TEX(d.uv0, _VideoMask);
                    fixed4 video = 0.0;
            
                    #if defined(_VIDEOMAP)
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                        videouv = _VideoMap.SampleLevel(bilinear_clamp, videouv, 0).rg;
                    #else
                        videouv -= 0.5;
                        videouv = rotate(videouv, _VideoRotation);
                        videouv.y *= _VideoRatio;
                        videouv += 0.5;
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                    #endif
            
            
            
                    if (videouv.x > 0.0 && videouv.x < 1.0 && videouv.y > 0.0 && videouv.y < 1.0 && any(mask > 0.01))
                    {
                        if (IsVideoAvailable())
                        {
                            #if defined(_VIDEOAST)
                                videouv = TRANSFORM_TEX(videouv, _Udon_VideoTex);
                            #endif
                            video.rgb = _Udon_VideoTex.SampleLevel(bilinear_clamp, videouv, 0);
                        } else video.rgb = _VideoFallback.SampleLevel(bilinear_clamp, videouv, 0);
            
                        fixed3 videocolor = video.rgb * mask.rgb * _VideoTint.rgb;
                        #if defined(_VIDEOALBEDO)
                            o.Albedo.rgb = lerp(o.Albedo.rgb, videocolor, _VideoTint.a);
                        #else
                            o.Emission += videocolor;
                        #endif
                    }
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            fixed4 SampleCrowdwave(float3 objectPos)
            {
            
                float2 position = mul(unity_ObjectToWorld, float4(objectPos, 1.0)).xz;
            
                float2 worldPosition = _Udon_CrowdwaveMeta._m20_m21_m22_m23.xz;
                float4 screenBounds = _Udon_CrowdwaveMeta._m00_m01_m02_m03;
                float2 worldBounds = _Udon_CrowdwaveMeta._m10_m11_m12_m13.xy;
                fixed worldRotation = _Udon_CrowdwaveMeta._m20_m21_m22_m23.w;
                half intensity = _Udon_CrowdwaveMeta._m10_m11_m12_m13.z;
                //_Udon_CrowdwaveMeta._m10_m11_m12_m13.w;
                //_Udon_CrowdwaveMeta._m30_m31_m32_m33;
            
                intensity = intensity > 1.0 ? intensity - 1.0 : 0.0;
            
                position -= worldPosition;
                position.xy = rotate(position.xy, worldRotation);
                position.xy += worldBounds / 2.0;
                position.xy /= worldBounds;
            
                half mask = _Udon_CrowdwaveMask.SampleLevel(sampler_Udon_CrowdwaveMask, position.xy, 0);
                if (!IsVideoAvailable() || position.x < 0.0 || position.x > 1.0 || position.y < 0.0 || position.y > 1.0) mask = 0.0;
            
                position.xy *= screenBounds.xy;
                position.xy += screenBounds.zw;
            
                fixed3 color = _Udon_VideoTex.SampleLevel(bilinear_clamp, position.xy, 0) * intensity * mask;
            
                return fixed4(color.xyz, mask);
            
            }
                
            void CrowdwaveFrag(MeshData d, inout SurfaceData o)
            {
            
                #if defined(_CROWDWAVE)
                    if (!_EnableCrowdwave) return;
            
                    half3 crowdwaveMask = _CrowdwaveMask.Sample(sampler_CrowdwaveMask, TRANSFORM_TEX(d.uv0, _CrowdwaveMask));
            
                    #if defined(_CROWDWAVERANGE)
                        fixed3 color = SampleCrowdwave(d.localSpacePosition).rgb;
                    #else
                        fixed3 color = SampleCrowdwave(0.0).rgb;
                    #endif
            
                    o.Emission += lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _CrowdwaveBias) * _CrowdwaveTint * crowdwaveMask;
                #endif
            }
            

            void LTCGICustomGI(MeshData d, SurfaceData o, inout half3 indirectSpecular, inout half3 indirectDiffuse)
            {
                #if !defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            o.Normal.xyz,
                            d.worldSpaceViewDir,
                            saturate((1 - o.Smoothness) + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            indirectSpecular += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            indirectSpecular += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        indirectDiffuse += ltcgiData.diffuse * _LTCGIDiffuseIntensity;
                    #endif
                }
                #endif
            }
            

            void LTCGIColor(MeshData d, FragmentData i, inout SurfaceData o, inout half4 FinalColor, bool facing)
            {
                #if defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        #if defined(PASS_OUTLINE)
                        return;
                        #endif
            
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        float3 viewDir = d.worldSpaceViewDir;
                        if (!facing)
                        {
                            viewDir = -d.worldSpaceViewDir;
                        }
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            d.worldNormal.xyz,
                            viewDir,
                            saturate(0.5 + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            FinalColor.rgb += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            FinalColor.rgb += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        half3 rampHSV = RGB2HSV(ltcgiData.diffuse);
                        rampHSV.z = tanh(rampHSV.z);
                        rampHSV.z = SAMPLE_TEXTURE2D(_LTCGIRamp, sampler_LTCGIRamp, half2(rampHSV.z, 0)).r;
                        FinalColor.rgb += HSV2RGB(rampHSV) * o.Albedo * _LTCGIDiffuseIntensity;
                        if (_LTCGIAlphaPremultiply)
                        {
                            FinalColor.rgb *= FinalColor.a;
                        }
                    #endif
                }
                #endif
            }
            

            void Toon_SheenFragment(MeshData d, inout SurfaceData o) {
                half sheenMask = _SheenMask.SampleLevel(sampler_SheenMask, TRANSFORM_TEX(d.uv0, _SheenMask), 0).r;
                if (sheenMask < 0.5) return;
            
                half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                NoV = saturate(pow(NoV, _SheenPower));
                half3 blendSource = lerp(_SheenTint, o.Albedo, _SheenAlbedoTint);
                half3 blended = blendSource;
                switch (_SheenBlendType)
                {
                    case 0: blended = BlendOverlay(o.Albedo, blendSource * NoV); break;
                    case 1: blended = BlendLighten(o.Albedo, blendSource * NoV); break;
                    case 2: blended = BlendScreen(o.Albedo, blendSource * NoV); break;
                    case 3: blended = o.Albedo * blendSource * NoV; break;
                }
                o.Albedo = lerp(o.Albedo, blended, _SheenStrength);
            
            }
            

            void VRCFeaturesVertex(inout VertexData v)
            {
                #if defined(VRC_FEATURES)
                bool isInVRHandCam = _VRChatCameraMode == 1;
                bool isInDesktopHandCam = _VRChatCameraMode == 2;
                bool isInVR = isVR();
                bool isInDesktop = !isInVR && !isInDesktopHandCam;
                bool isInVRMirror = _VRChatMirrorMode == 1;
                bool isInDesktopMirror = _VRChatMirrorMode == 2;
            
                if (_VRCHideInVR && isInVR)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktop && isInDesktop)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRCamera && isInVRHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopCamera && isInDesktopHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRMirror && isInVRMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopMirror && isInDesktopMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                #endif
            }
            

            half4 calcRamp(half NdL, half attenuation, half occlusion, int occlusionMode)
            {
                half remapRamp;
                remapRamp = NdL * 0.5 + 0.5;
                remapRamp *= lerp(1, occlusion, occlusionMode);
                #if defined(UNITY_PASS_FORWARDBASE)
                remapRamp *= attenuation;
                #endif
                half4 ramp = SAMPLE_TEXTURE2D(_Ramp, sampler_Ramp, half2(remapRamp, 0));
                return ramp;
            }
            
            half3 calcIndirectSpecular(half lightAttenuation, MeshData d, SurfaceData o, half roughness, half3 reflDir, half3 indirectLight, float3 fresnel, half4 ramp)
            {
                half3 spec = half3(0,0,0);
            
                #if defined(REFLECTION_MODE_OFF)
                return spec;
                #endif
            
                #if defined(REFLECTION_MODE_MATCAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    spec = o.BakedReflection;
                    if(o.ReflectionBlendMode != 1)
                    {
                        spec *= (indirectLight + (_LightColor0 * lightAttenuation) * 0.5);
                    }
                }
                #endif
            
                #if defined(REFLECTION_MODE_PBR) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 reflectionUV1 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
            
                    half3 indirectSpecular;
                    half interpolator = unity_SpecCube0_BoxMin.w;
            
                    UNITY_BRANCH
                    if (interpolator < 0.99999)
                    {
                        half3 reflectionUV2 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                        half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                        indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
                    }
                    else
                    {
                        indirectSpecular = probe0sample;
                    }
            
                    if (!any(indirectSpecular))
                    {
                        indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        indirectSpecular *= indirectLight;
                    }
                    spec = indirectSpecular * fresnel;
                }
                #endif
            
                #if defined(REFLECTION_MODE_BAKED_CUBEMAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    indirectSpecular *= indirectLight;
                    spec = indirectSpecular * fresnel;
                }
                #endif
                return spec;
            }
            
            half3 calcDirectSpecular(MeshData d, SurfaceData o, float lightNoL, float NoH, float NoV, float lightLoH, half3 lightColor, half3 lightHalfVector, half anisotropy)
            {
                half specularIntensity = o.SpecularIntensity;
                half3 specular = half3(0,0,0);
                half smoothness = max(0.01, (o.SpecularArea));
                smoothness *= 1.7 - 0.7 * smoothness;
            
                float rough = max(smoothness * smoothness, 0.0045);
                float Dn = D_GGX(NoH, rough);
                float3 F = 1-F_Schlick(lightLoH, 0);
                float V = V_SmithGGXCorrelated(NoV, lightNoL, rough);
                float3 directSpecularNonAniso = max(0, (Dn * V) * F);
            
                anisotropy *= saturate(5.0 * smoothness);
                float at = max(rough * (1.0 + anisotropy), 0.001);
                float ab = max(rough * (1.0 - anisotropy), 0.001);
                float D = D_GGX_Anisotropic(NoH, lightHalfVector, d.worldSpaceTangent, d.bitangent, at, ab);
                float3 directSpecularAniso = max(0, (D * V) * F);
            
                specular = lerp(directSpecularNonAniso, directSpecularAniso, saturate(abs(anisotropy * 100)));
                specular = lerp(specular, smoothstep(0.5, 0.51, specular), o.SpecularSharpness) * 3 * lightColor.xyz * specularIntensity; // Multiply by 3 to bring up to brightness of standard
                specular *= lerp(1, o.Albedo, o.SpecularAlbedoTint);
                specular = clamp(specular, 0, specularIntensity);
                return specular;
            }
            
            half3 calcReflectionBlending(SurfaceData o, half reflectivity, half3 col, half3 indirectSpecular)
            {
                half3 reflection = indirectSpecular.xyzz * reflectivity;
            
                // Doing a Lerp allows shaders to smoothly transition between blend modes
                col = lerp(
                    col + reflection, // Additive
                    lerp(
                        lerp(col, col * indirectSpecular.xyz, reflectivity), // Multiplicitive
                        col - reflection, // Subtractive
                        saturate(o.ReflectionBlendMode - 1)
                    ),
                    saturate(o.ReflectionBlendMode)
                );
                return col;
            }
            
            half4 calcEmission(SurfaceData o, half lightAvg)
            {
                #if defined(UNITY_PASS_FORWARDBASE) // Emission only in Base Pass, and vertex lights
                    float4 emission = 0;
                    emission = half4(o.Emission, 1);
            
                    half intensity = length(emission.rgb);
                    half3 emissionHSV = RGB2HSV(normalize(emission.rgb));
                    emissionHSV.x = fmod(emissionHSV.x + o.Hue, 1);
                    emissionHSV.y = saturate(emissionHSV.y + o.Saturation);
                    emissionHSV.z = saturate(emissionHSV.z + o.Value);
                    emission.rgb = HSV2RGB(emissionHSV) * intensity;
            
                    float4 scaledEmission = emission * saturate(smoothstep(1 - o.EmissionLightThreshold, 1 + o.EmissionLightThreshold, 1 - lightAvg));
                    float4 em = lerp(emission, scaledEmission, o.EmissionScaleWithLight);
                    return em;
                #else
                    return 0;
                #endif
            }
            
            void XSToonLighting(MeshData d, FragmentData i, SurfaceData o, inout half4 FinalColor)
            {
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half reflectance = o.Reflectivity;
                float oneMinusReflectivity = 1.0 - 0.04 - o.Metallic * (1.0 - 0.04);
                half3 f0 = 0.16 * reflectance * reflectance * (1 - o.Metallic) + o.Albedo * o.Metallic;
                half3 indirectDiffuse = 1;
                half3 indirectSpecular = 0;
                half3 directSpecular = 0;
                half occlusion = o.Occlusion;
                half perceptualRoughness = 1 - o.Smoothness;
                half3 tangentNormal = o.Normal;
                o.Normal = normalize(mul(o.Normal, d.TBNMatrix));
                half3 reflDir = calcReflView(d.worldSpaceViewDir, o.Normal);
            
                // Light Direction, based on method derived by Xiexe and Merlin
                #ifndef USING_DIRECTIONAL_LIGHT
                    half3 lightDir = UnityWorldSpaceLightDir(d.worldSpacePosition);
                #else
                    half3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
            
                half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                lightDir = (lightDir + probeLightDir);
            
                #if !defined(POINT) && !defined(SPOT)
                if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
                {
                    lightDir = half4(1, 1, 1, 0);
                }
                #endif
                lightDir = Unity_SafeNormalize(lightDir);
            
                // Attenuation
                UNITY_LIGHT_ATTENUATION(lightAttenuation, i, d.worldSpacePosition);
            
                // fix for rare bug where light atten is 0 when there is no directional light in the scene
                #ifdef UNITY_PASS_FORWARDBASE
                    if(all(_LightColor0.rgb == 0.0))
                        lightAttenuation = 1.0;
                #endif
            
                #if defined(USING_DIRECTIONAL_LIGHT)
                    half sharp = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, lightAttenuation); //Converge at the center line
                #endif
            
                half3 lightColor = _LightColor0.rgb;
            
                half3 lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                half lightNoL = dot(o.Normal, lightDir);
                half lightLoH = dot(lightDir, lightHalfVector);
            
                half NoV = abs(dot(o.Normal, d.worldSpaceViewDir)) + 1e-5;
                half NoH = saturate(dot(o.Normal, lightHalfVector));
                half3 stereoViewDir = calcStereoViewDir(d.worldSpacePosition);
                half NoSVDN = abs(dot(stereoViewDir, o.Normal));
            
                // Aniso Refl
                half3 reflViewAniso = 0;
            
                float3 anisotropicDirection = o.Anisotropy >= 0.0 ? d.bitangent : d.worldSpaceTangent.xyz;
                float3 anisotropicTangent = cross(anisotropicDirection, d.worldSpaceViewDir);
                float3 anisotropicNormal = cross(anisotropicTangent, anisotropicDirection);
                float bendFactor = abs(o.Anisotropy) * saturate(5.0 * perceptualRoughness);
                float3 bentNormal = normalize(lerp(o.Normal, anisotropicNormal, bendFactor));
                reflViewAniso = reflect(-d.worldSpaceViewDir, bentNormal);
            
                // Indirect diffuse
                #if !defined(LIGHTMAP_ON)
                    half3 L0 = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
                    indirectDiffuse.r = shEvaluateDiffuseL1Geomerics(L0.r, unity_SHAr.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.g = shEvaluateDiffuseL1Geomerics(L0.g, unity_SHAg.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.b = shEvaluateDiffuseL1Geomerics(L0.b, unity_SHAb.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse = max(0, indirectDiffuse);
                #elif defined(UNITY_PASS_FORWARDBASE)
                    // This here is an attempt to provide a somewhat usable ramp for lightmaps
                    half2 lightmapUV = d.lightmapUv.xy;
                    half4 bakedColorTex = 0;
                    half3 lightMap = tex2DFastBicubicLightmap(lightmapUV, bakedColorTex);
            
                    // Support basic directionality
                    #if defined(DIRLIGHTMAP_COMBINED)
                        half4 lightMapDirection = tex2DFastBicubicSample(unity_LightmapInd, samplerunity_Lightmap, lightmapUV);
            
                        // use lightmap direction if we can, realtim light is ignored in that case
                        lightDir.xyz = lightMapDirection.xyz - 0.5;
                        lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                        lightNoL = dot(o.Normal, lightDir);
                        lightLoH = dot(lightDir, lightHalfVector);
            
                        lightMap = DecodeDirectionalLightmap(lightMap, lightMapDirection, o.Normal);
            
                        lightColor = lightMap * 0.6;
                        indirectDiffuse = lightMap * 0.4;
                    #else
                        // Hacky way to support both cases of dirlight + baked and bakedy only but no directionality
                        // baked generates a light dir of 0,1,0
                        if (dot(lightDir.xyz, half3(0,1,0)) > 0.95) {
                            lightDir.xyz = 0;
                            lightNoL = 1;
                        }
                        indirectDiffuse = lightMap;
                    #endif
            
                    // we can end up using this twice, once above in the Dirlight logic and once here if both a realtime light
                    // and baked lightmap are present
                    half sharp2 = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, saturate(length(lightMap)));
                #endif
                indirectDiffuse *= lerp(occlusion, 1, o.OcclusionMode);
            
                if (_MonochromeLighting > 0)
                {
                    indirectDiffuse = lerp(indirectDiffuse, dot(indirectDiffuse, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
            
                bool lightEnv = any(lightDir.xyz);
                // if there is no realtime light - we rely solely on probes
                if (!lightEnv) {
                    lightColor = indirectDiffuse * 0.6;
                    indirectDiffuse = indirectDiffuse * 0.4;
                }
            
                #if defined(UNITY_PASS_FORWARDBASE)
                indirectDiffuse = lerp(indirectDiffuse, max(indirectDiffuse, 0.05), _MinLight);
                #endif
            
                half lightAvg = (dot(indirectDiffuse.rgb, grayscaleVec) + dot(lightColor.rgb, grayscaleVec)) / 2;
            
                // Light Ramp
                half4 ramp = 1;
                half4 diffuse = 1;
                ramp = calcRamp(lightNoL, lightAttenuation, occlusion, o.OcclusionMode);
                // Begin Added
                if (_MonochromeLighting > 0)
                {
                    lightColor = lerp(lightColor, dot(lightColor, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
                // End Added
                diffuse = calcDiffuse(lightAttenuation, o.Albedo.rgb, indirectDiffuse, lightColor, ramp);
            
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                float4 vLightAttenuations = 0;
                float4x4 vLightColors = getVertexLightsColors(d.worldSpacePosition, o.Normal, vLightAttenuations, false);
                float4x4 vLightDirections = getVertexLightsDir(d.worldSpacePosition);
                float4x4 vLightHalfVectors = 0;
                float4 vLightNoLs = 0;
                float4 vLightLoHs = 0;
                half4 vRamp = 1;
            
                [unroll(4)]
                for (int i = 0; i < 4; i++)
                {
                    vLightHalfVectors[i].rgb = Unity_SafeNormalize(vLightDirections[i] + d.worldSpaceViewDir);
                    vLightLoHs[i] = saturate(dot(vLightDirections[i], vLightHalfVectors[i]));
                    vLightNoLs[i] = saturate(dot(o.Normal, vLightDirections[i]));
                    vRamp = calcRamp(vLightNoLs[i], vLightAttenuations[i], occlusion, o.OcclusionMode);
                    diffuse += calcDiffuse(vLightAttenuations[i], o.Albedo.rgb, 0, vLightColors[i], vRamp);
                }
                #endif
            
                // Rims
                half3 rimLight = 0;
                #if defined(RIMLIGHT_ON)
                rimLight = o.RimLight.rgb;
                rimLight *= lightColor.xyz + indirectDiffuse.xyz;
                rimLight *= lerp(1, lightAttenuation + indirectDiffuse.xyz, o.RimAttenuation);
                #endif
            
                half3 rimShadow = 1;
                #if defined(RIMSHADOW_ON)
                rimShadow = o.RimShadow;
                #endif
            
                float3 fresnel = F_Schlick(NoV, f0);
            
                #if !defined(REFLECTION_MODE_OFF)
                indirectSpecular = calcIndirectSpecular(lightAttenuation, d, o, perceptualRoughness, reflViewAniso, indirectDiffuse, fresnel, ramp) * occlusion;
                #endif
            
                #if defined(SPECULAR_ON)
                directSpecular = calcDirectSpecular(d, o, lightNoL, NoH, NoV, lightLoH, lightColor, lightHalfVector, o.SpecularAnisotropy) * lightNoL * occlusion * lightAttenuation;
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                {
                    [unroll(4)]
                    for (int i = 0; i < 4; i++)
                    {
                        directSpecular += calcDirectSpecular(d, o, vLightNoLs[i], vLightLoHs[i], NoV, vLightLoHs[i], vLightColors[i], vLightHalfVectors[i], o.SpecularAnisotropy) * vLightNoLs[i] * occlusion * vLightAttenuations[i];
                    }
                }
                #endif
                #endif
            
                // Standard-Like transparent (premult alpha)
                if (_RenderType == 2)
                {
                    diffuse.rgb *= o.Alpha;
                    o.Alpha = 1 - (oneMinusReflectivity) + o.Alpha * (oneMinusReflectivity);
                }
            
                #if !defined(_NATIVE_A2C)
                {
                    // Standard-Like cutout
                    if (_RenderType == 1)
                    {
                        clip(o.Alpha - _Cutoff);
                    }
                }
                #endif
            
                FinalColor.rgb = diffuse.rgb * rimShadow.rgb;
            
                #if !defined(REFLECTION_MODE_OFF)
                FinalColor.rgb = calcReflectionBlending(o, reflectance, FinalColor.rgb, indirectSpecular);
                #endif
            
                FinalColor.rgb += max(directSpecular.xyz, rimLight.rgb).rgb;
                FinalColor.rgb += calcEmission(o, lightAvg);
            
                // Outline
                #if defined(PASS_OUTLINE)
                    half3 outlineColor = 0;
                    half3 ol = o.OutlineColor;
                    outlineColor = ol * saturate(lightAttenuation * lightNoL) * lightColor.rgb;
                    outlineColor += indirectDiffuse * ol;
                    outlineColor = lerp(outlineColor, ol, o.OutlineLightingMode);
                    FinalColor.rgb = outlineColor;
                #endif
            
                FinalColor.a = o.Alpha;
            
                // Premulty output by alpha for correct `Fade` mode
                #if defined(UNITY_PASS_FORWARDADD)
                if (_RenderType == 3)
                {
                    FinalColor.rgb *= o.Alpha;
                }
                #endif
            
                #endif
            }
            

            void VertexBase(inout VertexData v, inout FragmentData o)
            {
                #if defined(UNITY_PASS_META) && !defined(UNITY_PASS_BAKERY_META)
                o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
                #else
                o.pos = TransformObjectToHClip(v.vertex);
                #endif
                o.normal = v.normal;
                o.uv0 = v.uv0;
                o.uv1 = v.uv1;
                o.uv2 = v.uv2;
                o.uv3 = v.uv3;
                #if defined(NEED_UV4)
                o.uv4 = v.uv4;
                #endif
                #if defined(NEED_UV5)
                o.uv5 = v.uv5;
                #endif
                #if defined(NEED_UV6)
                o.uv6 = v.uv6;
                #endif
                #if defined(NEED_UV7)
                o.uv7 = v.uv7;
                #endif
                o.worldPos = mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1));
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldTangent.xyz = UnityObjectToWorldDir(v.tangent.xyz);
                o.worldTangent.w = v.tangent.w * unity_WorldTransformParams.w;
                o.vertexColor = v.color;
            
                #if defined(EDITOR_VISUALIZATION)
                o.vizUV = 0;
                o.lightCoord = 0;
                if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
                {
                    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.uv0.xy, v.uv1.xy, v.uv2.xy, unity_EditorViz_Texture_ST);
                }
                else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
                {
                    o.vizUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
                }
                #endif
            
                #if defined(NEED_SCREEN_POS)
                o.screenPos = GetScreenPosition(o.pos);
                o.screenPos.z = -TransformWorldToView(TransformObjectToWorld(v.vertex)).z;
                #endif
            
                #if !defined(UNITY_PASS_META)
                    #if defined(LIGHTMAP_ON)
                    o.lightmapUv.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    #endif
                    #if defined(DYNAMICLIGHTMAP_ON)
                    o.lightmapUv.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                    #endif
                        
                    UNITY_TRANSFER_LIGHTING(o, v.uv1.xy);
                    
                    #if !defined(UNITY_PASS_FORWARDADD)
                        // unity does some funky stuff for different platforms with these macros
                        #ifdef FOG_COMBINED_WITH_TSPACE
                            UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o, o.pos);
                        #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                            UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o, o.pos);
                        #else
                            UNITY_TRANSFER_FOG(o, o.pos);
                        #endif
                    #else
                        UNITY_TRANSFER_FOG(o, o.pos);
                    #endif
                #endif
            }
            

            // Free Functions

            // ForwardBase Vertex
            #if !defined(TESS_ENABLED)
            FragmentData Vertex(VertexData v)
            {
                UNITY_SETUP_INSTANCE_ID(v);
                FragmentData o;
                UNITY_INITIALIZE_OUTPUT(FragmentData, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // Meta Vertex Chain
                VRCFeaturesVertex(v);

                ToonOutlineVertex(v);

                AudioLinkVertex(v);

                // Meta VertexBase
                VertexBase(v, o);

                // Meta PostVertex Chain

                return o;
            }
            #endif

            // Meta Fragment
            half4 Fragment(FragmentData i, bool facing: SV_IsFrontFace) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(i);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                SurfaceData o = CreateSurfaceData();
                MeshData d = CreateMeshData(i, facing);
                // Meta pass only takes Albedo, Alpha and Emission
                half4 FinalColor = 1;

                // Meta Fragment Chain
                ToonMainFragment(d, o, facing);

                ToonOcclusionFragment(d, o);

                ToonNormalsFragment(d, o);

                ToonOutlineFragment(d, o);

                ToonSpecularFragment(d, o);

                ToonReflectionFragment(d, o);

                ToonALFragment(d, o);

                ToonEmissionFragment(o);

                ToonRimLightFragment(d, o);

                ToonShadowRimFragment(d, o);

                ChromaFrag(d, o);

                LumaFrag(d, o);

                VideoFrag(d, o);

                CrowdwaveFrag(d, o);

                Toon_SheenFragment(d, o);

                FinalColor = 1;

                // Meta Color Chain
                LTCGIColor(d, i, o, FinalColor, facing);

                UnityMetaInput metaIN;
                UNITY_INITIALIZE_OUTPUT(UnityMetaInput, metaIN);

                metaIN.Albedo = FinalColor.rgb;
				metaIN.Emission = o.Emission;

                #if defined(EDITOR_VISUALISATION)
                metaIN.VizUV = i.vizUV;
                metaIN.LightCoord = i.lightCoord;
                #endif

                return UnityMetaFragment(metaIN);
            }

            ENDCG
            // Meta Pass End
        }

        Pass
        {
            Tags { "LightMode" = "ShadowCaster"  }

            // ShadowCaster Pass Start
            CGPROGRAM
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma skip_variants FOG_LINEAR FOG_EXP FOG_EXP2
            #pragma multi_compile_shadowcaster
            #pragma vertex Vertex
            #pragma fragment Fragment
            #pragma shader_feature_local_fragment _NATIVE_A2C
            
            #pragma shader_feature_local_fragment SEPARATE_ALPHA
            
            #pragma shader_feature _AUDIOLINKVERTEX
            
            #pragma shader_feature_local_fragment NORMALS_SET
            #pragma shader_feature_local_fragment DETAIL_NORMALS_SET
            
            #pragma shader_feature_local OUTLINE_ENABLED
            
            #pragma shader_feature_local_fragment SPECULAR_ON
            
            #pragma shader_feature_local_fragment REFLECTION_MODE_OFF REFLECTION_MODE_PBR REFLECTION_MODE_BAKED_CUBEMAP REFLECTION_MODE_MATCAP
            
            #pragma shader_feature_local_fragment AL_MODE_SINGLE_CHANNEL AL_MODE_PACKED_MAP AL_MODE_UV_BASED
            #if !defined(AL_MODE_SINGLE_CHANNEL) && !defined(AL_MODE_PACKED_MAP) && !defined(AL_MODE_UV_BASED)
                #define AL_MODE_NONE
            #endif
            
            #pragma shader_feature_local_fragment _EMISSION
            
            #pragma shader_feature_local_fragment RIMLIGHT_ON
            
            #pragma shader_feature_local_fragment RIMSHADOW_ON
            
            #pragma shader_feature _AUDIOLINKCHROMA
            #pragma shader_feature _CHROMAMAP
            
            #pragma shader_feature _LUMA
            #pragma shader_feature _LUMALEGACY
            #pragma shader_feature _LUMAMAP
            
            #pragma shader_feature _VIDEO
            #pragma shader_feature _VIDEOMAP
            #pragma shader_feature _VIDEOAST
            #pragma shader_feature _VIDEOALBEDO
            
            #pragma shader_feature _CROWDWAVE
            #pragma shader_feature _CROWDWAVERANGE
            
            #pragma shader_feature_local_fragment INTEGRATE_LTCGI
            
            #pragma shader_feature_local_vertex VRC_FEATURES
            
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_INSTANCED_LOD_FADE
            #define UNITY_INSTANCED_SH
            #define UNITY_INSTANCED_LIGHTMAPSTS

            #ifndef UNITY_PASS_SHADOWCASTER
                #define UNITY_PASS_SHADOWCASTER
            #endif

            #include "UnityPBSLighting.cginc"

            // ShaderDefines
            #define NEED_FRAGMENT_IN_SHADOW
            #define NEED_ALBEDO_ALPHA
            
            #define GLOBAL_UV_SET
            
            #define PIXEL_NORMAL_SET
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #if defined(INTEGRATE_LTCGI)
                #define _INTEGRATE_CUSTOMGI_FLEX
            #endif
            
            #define INCLUDE_LTCGI defined(INTEGRATE_LTCGI)
            
            #if INCLUDE_LTCGI
                #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI_structs.cginc"
            #endif
            
            #define ORL_LIGHTING_MODEL_TOON
            
            #if defined(UNITY_PBS_USE_BRDF2) || defined(SHADER_API_MOBILE)
                #define PLAT_QUEST
            #else
                #ifdef PLAT_QUEST
                    #undef PLAT_QUEST
                #endif
            #endif
            
            #define NEED_SCREEN_POS
            
            #define grayscaleVec float3(0.2125, 0.7154, 0.0721)
            // DataStructs
            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 color : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD7;
                #endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct FragmentData
            {
                #if defined(UNITY_PASS_SHADOWCASTER)
                V2F_SHADOW_CASTER;
                #else
                float4 pos : SV_POSITION;
                #endif
                    
                float3 normal : RAW_NORMAL;
                float4 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 uv2 : TEXCOORD3;
                float4 uv3 : TEXCOORD4;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD5;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD6;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD7;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD8;
                #endif
                float3 worldPos : WORLD_POS;
                float3 worldNormal : WORLD_NORMAL;
                float4 worldTangent : WORLD_TANGENT;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                float4 lightmapUv : LM_UV;
                #endif
                centroid float4 vertexColor : VERTEX_COLOR;
            
                #if !defined(UNITY_PASS_META)
                UNITY_LIGHTING_COORDS(9, 10)
                UNITY_FOG_COORDS(11)
                #endif
            
                #if defined(EDITOR_VISUALIZATION)
                float2 vizUV : VIZ_UV;
                float4 lightCoord : LIGHT_COORD;
                #endif
                  
                #if defined(NEED_SCREEN_POS)
                float4 screenPos: SCREENPOS;
                #endif
            
                #if defined(EXTRA_V2F_0)
                float4 extraV2F0 : EXTRA_V2F_BLOCK0;
                #endif
                #if defined(EXTRA_V2F_1)
                float4 extraV2F1 : EXTRA_V2F_BLOCK1;
                #endif
                #if defined(EXTRA_V2F_2)
                float4 extraV2F2 : EXTRA_V2F_BLOCK2;
                #endif
                #if defined(EXTRA_V2F_3)
                float4 extraV2F3 : EXTRA_V2F_BLOCK3;
                #endif
            
                // Additional Fragment Data
                
                // Additional Fragment Data End
            
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            struct LTCGIAccumulatorStruct {
                float3 diffuse;
                float3 specular;
            };
            
            #define LTCGI_V2_CUSTOM_INPUT LTCGIAccumulatorStruct
            
            struct MeshData
            {
                float4 uv0;
                float4 uv1;
                float4 uv2;
                float4 uv3;
                #if defined(NEED_UV4)
                float4 uv4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half4 lightmapUv;
                #endif
                half4 vertexColor;
                half3 normal;
                half3 worldNormal;
                half3 localSpacePosition;
                half3 worldSpacePosition;
                half3 worldSpaceViewDir;
                half3 worldSpaceTangent;
                half3 tangentSpaceViewDir;
                float3x3 TBNMatrix;
                half3 bitangent;
                half3 svdn;
                float4 extraV2F0;
                float4 extraV2F1;
                float4 extraV2F2;
                float4 extraV2F3;
                float4 screenPos;
            
                // Additional Mesh Data
                
                // Additional Mesh Data End
            };
            
            MeshData CreateMeshData(FragmentData i, bool facing)
            {
                MeshData d = (MeshData) 0;
                d.uv0 = i.uv0;
                d.uv1 = i.uv1;
                d.uv2 = i.uv2;
                d.uv3 = i.uv3;
                #if defined(NEED_UV4)
                d.uv4 = i.uv4;
                #endif
                #if defined(NEED_UV5)
                d.uv5 = i.uv5;
                #endif
                #if defined(NEED_UV6)
                d.uv6 = i.uv6;
                #endif
                #if defined(NEED_UV7)
                d.uv7 = i.uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.lightmapUv = i.lightmapUv;
                #endif
                d.worldNormal = normalize(i.worldNormal);
                d.localSpacePosition = mul(unity_WorldToObject, float4(i.worldPos, 1)).xyz;
                d.worldSpacePosition = i.worldPos;
                d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
            
                d.normal = i.normal;
                d.vertexColor = i.vertexColor;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.bitangent = normalize(cross(i.worldTangent.xyz, d.worldNormal) * i.worldTangent.w * - 1);
                d.worldSpaceTangent = normalize(i.worldTangent.xyz);
                d.TBNMatrix = float3x3(normalize(i.worldTangent.xyz), d.bitangent, d.worldNormal);
                d.TBNMatrix[2].xyz *= facing ? 1 : -1;
                d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
                #endif
            
                #if UNITY_SINGLE_PASS_STEREO
                half3 stereoCameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
                d.svdn = normalize(stereoCameraPos - d.worldSpacePosition);
                #else
                d.svdn = d.worldSpaceViewDir;
                #endif
            
                #if defined(EXTRA_V2F_0)
                d.extraV2F0 = i.extraV2F0;
                #endif
                #if defined(EXTRA_V2F_1)
                d.extraV2F1 = i.extraV2F1;
                #endif
                #if defined(EXTRA_V2F_2)
                d.extraV2F2 = i.extraV2F2;
                #endif
                #if defined(EXTRA_V2F_3)
                d.extraV2F3 = i.extraV2F3;
                #endif
                #if defined(NEED_SCREEN_POS)
                d.screenPos = i.screenPos;
                #endif
            
                // Additional Mesh Data Creator
                
                // Additional Mesh Data Creator End
            
                return d;
            }
            
            struct SurfaceData
            {
                half3 Albedo;
                half Alpha;
                half Hue;
                half Saturation;
                half Value;
                    
                half Metallic;
                half Smoothness;
                half Anisotropy;
                half3 Normal;
                    
                half Occlusion;
                int OcclusionMode;
            
                half3 Emission;
                int EmissionScaleWithLight;
                half EmissionLightThreshold;
                    
                half ShadowSharpness;
                    
                half4 RimLight;
                half RimAttenuation;
                half4 RimShadow;
                    
                half SpecularIntensity;
                half SpecularArea;
                half SpecularAlbedoTint;
                half SpecularAnisotropy;
                half SpecularSharpness;
                    
                half Reflectivity;
                half3 BakedReflection;
                half ReflectionBlendMode;
                    
                half3 OutlineColor;
                int OutlineLightingMode;
            
                // Additional Surface Data
                
                // Additional Surface Data End
            };
            
            SurfaceData CreateSurfaceData()
            {
                SurfaceData o = (SurfaceData) 0;
                o.Albedo = 0.5;
                o.Occlusion = 1;
                o.Normal = half3(0, 0, 1);
                o.Smoothness = 0.5;
                o.Alpha = 1;
                o.RimShadow = 1;
                o.RimAttenuation = 1;
                return o;
            }
            // GlobalVariables

            // Variables
            float4 _MainTex_ST;
            int _MainTexUVSet;
            int _TintByVertexColor;
            half4 _Color;
            half4 _BackfaceColor;
            half _BackfaceAlbedoTint;
            half _AlphaScale;
            half _Hue;
            half _Saturation;
            half _Value;
            half _ShadowSharpness;
            half2 GLOBAL_uv;
            int _OcclusionMode;
            half _OcclusionStrength;
            int _OcclusionTilingMode;
            half _OcclusionTiling;
            int _OcclusionDetailEnabled;
            half _OcclusionDetailStrength;
            int _OcclusionDetailTilingMode;
            half _OcclusionDetailTiling;
            #if defined(_AUDIOLINKVERTEX)
                uniform int _EnableAudioLinkVertex;
            #endif
            uniform fixed4 _AudioLinkVertexMap_ST;
            uniform half _AudioLinkVertexHistory;
            uniform int _AudioLinkVertexBand;
            uniform half _AudioLinkVertexIntensity;
            int _BumpMapTilingMode;
            float _BumpMapTiling;
            half _BumpScale;
            int _FlipBumpY;
            int _NormalBicubicSampling;
            half4 _DetailNormalMap_ST;
            int _DetailNormalsUVSet;
            half _DetailNormalTiling;
            half _DetailNormalScale;
            half _FlipDetailNormalY;
            int _DetailNormalMaskUVSet;
            half _DetailNormalMaskTiling;
            half3 GLOBAL_pixelNormal;
            int _StencilBasePass;
            int _StencilBaseComp;
            int _StencilOutlineComp;
            half4 _OutlineColor;
            int _OutlineLightingMode;
            half _OutlineAlbedoTint;
            half4 _OutlineMask_ST;
            half _OutlineWidth;
            int _OutlineWidthAdjustByVertexColor;
            int _SpecularMapUVSet;
            int _SpecularTilingMode;
            half _SpecularTiling;
            half _SpecularIntensity;
            half _SpecularRoughness;
            half _SpecularSharpness;
            half _SpecularAnisotropy;
            half _SpecularAlbedoTint;
            int _SpecularMaskTilingMode;
            half _SpecularMaskTiling;
            half _SpecularMaskStrength;
            int _ReflectionMode;
            half _ReflectionBlendMode;
            half _Smoothness;
            half _Metallic;
            int _RoughnessMode;
            int _MetallicGlossMapTilingMode;
            half _MetallicGlossMapTiling;
            half4 _MetallicRemap;
            half4 _SmoothnessRemap;
            half4 _MetallicGlossMap_TexelSize;
            half _ReflectionAnisotropy;
            half _MatcapBlur;
            half _MatcapTintToDiffuse;
            int _ReflectivityMaskTilingMode;
            half _ReflectivityMaskTiling;
            half _ReflectivityLevel;
            int _ALBand;
            half4 _ALEmissionColor;
            int _ALEmissionDotMask;
            int _ALEmissionDotMaskInvert;
            half _ALEmissionDotMaskSmoothing;
            int _ALGradientOnRed;
            int _ALGradientOnGreen;
            int _ALGradientOnBlue;
            half4 _ALPackedRedColor;
            half4 _ALPackedGreenColor;
            half4 _ALPackedBlueColor;
            int _ALSmoothingLevel;
            int _ALUVWidth;
            int _ALMapUVSet;
            half4 _EmissionColor;
            half _EmissionTintToDiffuse;
            int _EmissionScaleWithLight;
            half _EmissionScaleWithLightSensitivity;
            half4 _RimTint;
            half _RimIntensity;
            half _RimAlbedoTint;
            half _RimEnvironmentTint;
            half _RimAttenuation;
            half _RimRange;
            half _RimThreshold;
            half _RimSharpness;
            half4 _ShadowRimTint;
            half _ShadowRimRange;
            half _ShadowRimThreshold;
            half _ShadowRimSharpness;
            half _ShadowRimAlbedoTint;
            #if defined(_AUDIOLINKCHROMA)
                uniform int _EnableAudioLinkChroma;
            #endif
            uniform float4 _ChromaMask_ST;
            uniform fixed4 _ChromaTint;
            uniform int _ChromaForceIdle;
            uniform int _ChromaModeR;
            uniform int _ChromaModeG;
            uniform int _ChromaModeB;
            uniform fixed _ChromaHistory;
            uniform half _ChromaWarp;
            uniform half _ChromaSpeed;
            uniform half _ChromaBiased;
            uniform int _ChromaForceTheme;
            uniform fixed4 _ChromaTheme0;
            uniform fixed4 _ChromaTheme1;
            uniform fixed4 _ChromaTheme2;
            uniform fixed4 _ChromaTheme3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
                uniform int _ReactPriority;
            #endif
            #if !defined(_CHROMAMAP)
                uniform int _ChromaBand;
                uniform fixed _ChromaRotation;
            #endif
            #if defined(_LUMA)
                uniform int _EnableLuma;
            #endif
            #if defined(_LUMALEGACY)
                uniform fixed4 _Stored_TexelSize;
                const static int GRADSTART[3] = { LUMA_LEGACY_GRAD_START1, LUMA_LEGACY_GRAD_START2, LUMA_LEGACY_GRAD_START3 };
            #endif
            uniform float4 _LumaMask_ST;
            uniform fixed4 _LumaTint;
            uniform half _LumaWarp;
            uniform half _LumaBiased;
            uniform int _LumaGrad1;
            uniform int _LumaGrad2;
            uniform int _LumaGrad3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
            #endif
            #if !defined(_LUMAMAP)
                uniform fixed _LumaRotation;
            #endif
            #if defined(_VIDEO)
                uniform int _EnableVideo;
            #endif
            #ifndef _UDON_VIDEOTEX_ST
                #define _UDON_VIDEOTEX_ST
                uniform float4 _Udon_VideoTex_ST;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
                uniform float4 _Udon_VideoTex_TexelSize;
            #endif
            uniform fixed4 _VideoTint;
            uniform float4 _VideoMask_ST;
            #if !defined(_VIDEOMAP)
                uniform fixed _VideoRatio;
                uniform fixed _VideoRotation;
            #endif
            #if defined(_CROWDWAVE)
                uniform int _EnableCrowdwave;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
            #endif
            uniform fixed4 _CrowdwaveTint;
            uniform half _CrowdwaveBias;
            uniform float4 _CrowdwaveMask_ST;
            uniform float4x4 _Udon_CrowdwaveMeta;
            int _LTCGIEnableOnMobile;
            int _LTCGIClampBrightness;
            half _LTCGIMaxBrightness;
            half _LTCGIDiffuseIntensity;
            half _LTCGISpecularIntensity;
            half _LTCGIRoughnessModifier;
            int _LTCGIAlphaPremultiply;
            half _SheenStrength;
            half _SheenPower;
            half4 _SheenTint;
            half _SheenAlbedoTint;
            int _SheenBlendType;
            half4 _SheenMask_ST;
            int _VRCHideInVR;
            int _VRCHideInDesktop;
            int _VRCHideInVRCamera;
            int _VRCHideInDesktopCamera;
            int _VRCHideInVRMirror;
            int _VRCHideInDesktopMirror;
            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            int _IgnoreLightprobeNormal;
            int _MinLight;
            half _MonochromeLighting;
            int _RenderType;
            half _Cutoff;

            // Textures
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            #if defined(SEPARATE_ALPHA)
            TEXTURE2D(_AlphaTex);
            #endif
            TEXTURE2D(_OcclusionMap);
            TEXTURE2D(_OcclusionDetail);
            TEXTURE2D(_AudioLinkVertexMap);
            SAMPLER(sampler_AudioLinkVertexMap);
            TEXTURE2D(_BumpMap);
            SAMPLER(sampler_BumpMap);
            TEXTURE2D(_DetailNormalMap);
            SAMPLER(sampler_DetailNormalMap);
            TEXTURE2D(_DetailNormalMask);
            SAMPLER(sampler_DetailNormalMask);
            TEXTURE2D(_OutlineTex);
            TEXTURE2D(_OutlineMask);
            SAMPLER(sampler_OutlineTex);
            SAMPLER(sampler_OutlineMask);
            TEXTURE2D(_SpecularMap);
            TEXTURE2D(_SpecularMask);
            TEXTURE2D(_Matcap);
            SAMPLER(sampler_Matcap);
            TEXTURE2D(_MetallicGlossMap);
            TEXTURE2D(_ReflectivityMask);
            TEXTURE2D(_ALMap);
            SAMPLER(sampler_ALMap);
            TEXTURE2D(_EmissionMap);
            TEXTURE2D(_ChromaMask);
            #if defined(_CHROMAMAP)
                TEXTURE2D(_ChromaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                    TEXTURE2D(_Stored);
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
                SAMPLER(bilinear_clamp);
            #endif
            TEXTURE2D(_LumaMask);
            #if defined(_LUMAMAP)
                TEXTURE2D(_LumaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef POINT_CLAMP
                #define POINT_CLAMP
                SAMPLER(point_clamp);
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
                TEXTURE2D(_Udon_VideoTex);
            #endif
            TEXTURE2D(_VideoMask);
            TEXTURE2D(_VideoFallback);
            #if defined(_VIDEOMAP)
                TEXTURE2D(_VideoMap);
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
            #endif
            TEXTURE2D(_Udon_CrowdwaveMask);
            TEXTURE2D(_CrowdwaveMask);
            SAMPLER(sampler_Udon_CrowdwaveMask);
            SAMPLER(sampler_CrowdwaveMask);
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            TEXTURE2D(_LTCGIRamp);
            SAMPLER(sampler_LTCGIRamp);
            TEXTURE2D(_SheenMask);
            SAMPLER(sampler_SheenMask);
            TEXTURE2D(_Ramp);
            SAMPLER(sampler_Ramp);
            TEXTURECUBE(_BakedCubemap);
            SAMPLER(sampler_BakedCubemap);

            // PassFunctions
            #if INCLUDE_LTCGI
            
            void LTCGICallbackDiffuse(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.diffuse += output.intensity * output.color;
            }
            
            void LTCGICallbackSpecular(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.specular += output.intensity * output.color;
            }    
            
            #define LTCGI_V2_DIFFUSE_CALLBACK LTCGICallbackDiffuse
            #define LTCGI_V2_SPECULAR_CALLBACK LTCGICallbackSpecular
                
            #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI.cginc"
            #endif

            // Functions
            void ToonMainFragment(MeshData d, inout SurfaceData o, bool facing)
            {
                half2 uv = 0;
                switch (_MainTexUVSet) {
                    case 0: uv = d.uv0; break;
                    case 1: uv = d.uv1; break;
                    case 2: uv = d.uv2; break;
                    case 3: uv = d.uv3; break;
                }
                uv = uv * _MainTex_ST.xy + _MainTex_ST.zw;
                GLOBAL_uv = uv;
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, GLOBAL_uv);
                if (facing) {
                    albedo *= _Color;
                } else {
                    albedo = lerp(_BackfaceColor, albedo * _BackfaceColor, _BackfaceAlbedoTint);
                }
                half3 albedoHSV = RGB2HSV(albedo.rgb);
            
                albedoHSV.x = fmod(albedoHSV.x + _Hue, 1);
                albedoHSV.y = saturate(albedoHSV.y + _Saturation);
                albedoHSV.z = saturate(albedoHSV.z + _Value);
                albedo.rgb = HSV2RGB(albedoHSV);
            
                o.Hue = _Hue;
                o.Saturation = _Saturation;
                o.Value = _Value;
                    
                if (_TintByVertexColor) {
                    albedo.rgb *= d.vertexColor.rgb;
                }
                o.Albedo = albedo.rgb;
                #if defined(NEED_ALBEDO_ALPHA)
                {
                    #if defined(SEPARATE_ALPHA) 
                    o.Alpha = saturate(SAMPLE_TEXTURE2D(_AlphaTex, sampler_MainTex, GLOBAL_uv).r * _AlphaScale);
                    #else
                    o.Alpha = saturate(albedo.a * _AlphaScale);
                    #endif
                }
                #else
                o.Alpha = 1;
                #endif
                o.ShadowSharpness = _ShadowSharpness;
            }
            

            void ToonOcclusionFragment(MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half occlusion = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_MainTex, lerp(globalUv * _OcclusionTiling, d.uv0 * _OcclusionTiling, _OcclusionTilingMode)).r;
                o.Occlusion = lerp(1, occlusion, _OcclusionStrength);
                    
                if (_OcclusionDetailEnabled) {
                    half occlusionDetail = SAMPLE_TEXTURE2D(_OcclusionDetail, sampler_MainTex, lerp(globalUv * _OcclusionDetailTiling, d.uv0 * _OcclusionDetailTiling, _OcclusionDetailTilingMode)).r;
                    o.Occlusion *= lerp(1, occlusionDetail, _OcclusionDetailStrength);
                }
            
                o.OcclusionMode = _OcclusionMode;
            }
            

            
                float4 QuanternionMultiply(float4 a, float4 b)
                {
            
                    return float4(a.w * b.xyz + b.w * a.xyz + cross(a.xyz, b.xyz), a.w * b.w - dot(a.xyz, b.xyz));
                }
            
                float3 QuanternionRotate(float3 pos, float3 vec, float rotate)
                {
            
                    rotate /= 2.0;
            
                    float4 quat1 = float4(vec.xyz, cos(rotate));
                    quat1.xyz *= sin(rotate);
            
                    float4 quat2 = float4(-quat1.x, -quat1.y, -quat1.z, quat1.w);
            
                    float4 mulpos = (quat1 * float4(pos, 0.0)) * quat2;
                    mulpos = QuanternionMultiply(QuanternionMultiply(quat1, float4(pos, 0.0)), quat2);
            
                    return mulpos;
            
                }
            
                void AudioLinkVertex(inout VertexData v)
                {
                    #if defined(_AUDIOLINKVERTEX)
            
                        if (!_EnableAudioLinkVertex) return;
            
                        half2 map = _AudioLinkVertexMap.SampleLevel(sampler_AudioLinkVertexMap, TRANSFORM_TEX(v.uv0.xy, _AudioLinkVertexMap), 0).rg;
                        half value = AudioLinkIsAvailable() ? AudioLinkLerp(float2(map.g * _AudioLinkVertexHistory, _AudioLinkVertexBand)).r * _AudioLinkVertexIntensity : 0.0;
            
                        v.vertex.xyz += v.normal.xyz * value * map.r;
            
                    #endif
                }
            

            void ToonNormalsFragment(inout MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                #if defined(NORMALS_SET)
                float4 normalTex = 0;
                if (_NormalBicubicSampling) {
                    normalTex = tex2DFastBicubicSampleNoChecks(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                } else {
                    normalTex = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                }
                if (_FlipBumpY)
                {
                    normalTex.y = 1 - normalTex.y;
                }
                half3 normal = UnpackNormalScale(normalTex, _BumpScale);
            
                o.Normal = BlendNormals(o.Normal, normal);
                #endif
                    
                #if defined(DETAIL_NORMALS_SET)
                    
                half2 detailUV = 0;
                switch (_DetailNormalsUVSet) {
                    case 0: detailUV = d.uv0; break;
                    case 1: detailUV = d.uv1; break;
                    case 2: detailUV = d.uv2; break;
                    case 3: detailUV = d.uv3; break;
                }
                detailUV = detailUV * _DetailNormalTiling;
                half4 detailNormalTex = SAMPLE_TEXTURE2D(_DetailNormalMap, sampler_DetailNormalMap, detailUV);
                if (_FlipDetailNormalY)
                {
                    detailNormalTex.y = 1 - detailNormalTex.y;
                }
            
                half2 detailMaskUV = 0;
                switch (_DetailNormalMaskUVSet) {
                    case 0: detailMaskUV = d.uv0; break;
                    case 1: detailMaskUV = d.uv1; break;
                    case 2: detailMaskUV = d.uv2; break;
                    case 3: detailMaskUV = d.uv3; break;
                }
                detailMaskUV *= _DetailNormalMaskTiling;
                half detailMask = SAMPLE_TEXTURE2D(_DetailNormalMask, sampler_DetailNormalMask, detailMaskUV).r;
            
                half3 detailNormal = UnpackNormalScale(detailNormalTex, _DetailNormalScale);
                    
                o.Normal = lerp(o.Normal, BlendNormals(o.Normal, detailNormal), detailMask);
            
                #endif
            
                #if defined(NORMALS_SET) || defined(DETAIL_NORMALS_SET)
            
                half3 properNormal = normalize(mul(o.Normal, d.TBNMatrix));
                d.worldSpaceTangent.xyz = cross(d.bitangent.xyz, properNormal);
                d.bitangent.xyz = cross(properNormal, d.worldSpaceTangent.xyz);
                d.TBNMatrix = float3x3(normalize(d.worldSpaceTangent.xyz), d.bitangent, d.worldNormal);
                GLOBAL_pixelNormal = properNormal;
            
                #else
            
                GLOBAL_pixelNormal = normalize(mul(o.Normal, d.TBNMatrix));
            
                #endif
            }
            

            void ToonOutlineVertex(inout VertexData v) {
                #if defined(PASS_OUTLINE)
                half mask = SAMPLE_TEXTURE2D_LOD(_OutlineMask, sampler_OutlineMask, TRANSFORM_TEX(v.uv0, _OutlineMask), 0);
                half3 width = mask * _OutlineWidth * .01;
                width *= min(distance(TransformObjectToWorld(v.vertex.xyz), _WorldSpaceCameraPos) * 3, 1);
                v.vertex.xyz += v.normal.xyz * lerp(width, width * v.color.r, _OutlineWidthAdjustByVertexColor);
                    
                #endif
            }
            

            void ToonOutlineFragment(MeshData d, inout SurfaceData o) {
                half3 outline = SAMPLE_TEXTURE2D(_OutlineTex, sampler_OutlineTex, d.uv0).rgb;
                o.OutlineColor = lerp(_OutlineColor * outline, _OutlineColor * outline * o.Albedo, _OutlineAlbedoTint);
                o.OutlineLightingMode = _OutlineLightingMode;
            }
            

            void ToonSpecularFragment(MeshData d, inout SurfaceData o) {
                #if defined(SPECULAR_ON)
                    
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half2 specularUv = lerp(globalUv * _SpecularTiling, d.uv0 * _SpecularTiling, _SpecularTilingMode);
                half2 specularMaskUv = lerp(globalUv * _SpecularMaskTiling, d.uv0 * _SpecularMaskTiling, _SpecularMaskTilingMode);
            
                half3 specMap = SAMPLE_TEXTURE2D(_SpecularMap, sampler_MainTex, specularUv);
                o.SpecularIntensity = max(0, _SpecularIntensity * specMap.r);
                o.SpecularArea = max(0.01, GSAA_Filament(d.worldNormal, _SpecularRoughness, 0.05, 0.1) * specMap.b);
                o.SpecularAnisotropy = _SpecularAnisotropy;
                o.SpecularAlbedoTint = _SpecularAlbedoTint * specMap.g;
                o.SpecularSharpness = _SpecularSharpness;
                o.SpecularArea = lerp(o.SpecularArea, o.SpecularArea * SAMPLE_TEXTURE2D(_SpecularMask, sampler_MainTex, specularMaskUv).r, _SpecularMaskStrength);
                #endif
            }
            

            void ToonReflectionFragment(MeshData d, inout SurfaceData o) {
                #if defined(REFLECTION_MODE_OFF)
                return;
                #endif
            
                o.ReflectionBlendMode = _ReflectionBlendMode;
            
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half mask = SAMPLE_TEXTURE2D(_ReflectivityMask, sampler_MainTex, lerp(globalUv * _ReflectivityMaskTiling, d.uv0 * _ReflectivityMaskTiling, _ReflectivityMaskTilingMode)).r;
                mask *= _ReflectivityLevel;
                    
                #if defined(REFLECTION_MODE_PBR) || defined(REFLECTION_MODE_BAKED_CUBEMAP)
                        
                half4 metalSmooth = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MainTex, lerp(globalUv * _MetallicGlossMapTiling, d.uv0 * _MetallicGlossMapTiling, _MetallicGlossMapTilingMode));
                int hasMetallicSmooth = _MetallicGlossMap_TexelSize.z > 8;
                half metal = metalSmooth.r;
                half smooth = metalSmooth.a;
                if (_RoughnessMode)
                {
                    smooth = 1 - smooth;
                }
                metal = remap(metal, 0, 1, _MetallicRemap.x, _MetallicRemap.y);
                smooth = remap(smooth, 0, 1, _SmoothnessRemap.x, _SmoothnessRemap.y);
                o.Metallic = lerp(_Metallic, metal, hasMetallicSmooth);
                o.Smoothness = lerp(_Smoothness, smooth, hasMetallicSmooth);
                o.Anisotropy = _ReflectionAnisotropy;
                    
                #elif defined(REFLECTION_MODE_MATCAP)
                    
                half3 upVector = half3(0,1,0);
                half2 remapUV = calcMatcapUV(upVector, d.worldSpaceViewDir, GLOBAL_pixelNormal);
                half4 spec = 0; 
                spec = SAMPLE_TEXTURE2D_LOD(_Matcap, sampler_Matcap, remapUV, _MatcapBlur * UNITY_SPECCUBE_LOD_STEPS);
            
                spec.rgb *= lerp(1, o.Albedo, _MatcapTintToDiffuse);
                o.BakedReflection = spec.rgb;
                    
                #endif
            
                o.Reflectivity = mask;
            }
            

            void ToonALFragment(MeshData d, inout SurfaceData o) {
                #if defined(AL_MODE_NONE)
                    return;
                #else
            
                if(AudioLinkIsAvailable()) {
                    half2 alUV = 0;
            
                    half2 globalUv = 0;
            
                    #if defined(GLOBAL_UV_SET)
                    globalUv = GLOBAL_uv;
                    #else
                    globalUv = d.uv0;
                    #endif
            
                    switch (_ALMapUVSet) {
                        case 0: alUV = globalUv; break;
                        case 1: alUV = d.uv1; break;
                        case 2: alUV = d.uv2; break;
                        case 3: alUV = d.uv3; break;
                    }
                    half4 alMask = SAMPLE_TEXTURE2D(_ALMap, sampler_ALMap, alUV);
            
                    #if defined(AL_MODE_SINGLE_CHANNEL)
            
                    half sampledAL = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        sampledAL = AudioLinkData(int2(0, _ALBand)).x;
                    } else {
                        sampledAL = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel, _ALBand)).x;
                    }
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
            
                    #elif defined(AL_MODE_PACKED_MAP)
            
                    half audioDataBass = 0;
                    half audioDataMids = 0;
                    half audioDataHighs = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        audioDataBass = AudioLinkData(ALPASS_AUDIOBASS).x;
                        audioDataMids = AudioLinkData(ALPASS_AUDIOLOWMIDS).x;
                        audioDataHighs = (AudioLinkData(ALPASS_AUDIOHIGHMIDS).x + AudioLinkData(ALPASS_AUDIOTREBLE).x) * 0.5;
                    } else {
                        audioDataBass = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,0)).x;
                        audioDataMids = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,1)).x;
                        audioDataHighs = (AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,2)).x + AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,3)).x) * 0.5;
                    }
            
                    audioDataMids = clamp(audioDataMids, 0, 0.98);
            
                    half tLow = smoothstep((1-audioDataBass), (1-audioDataBass) + 0.01, alMask.r) * alMask.a;
                    half tMid = smoothstep((1-audioDataMids), (1-audioDataMids) + 0.01, alMask.g) * alMask.a;
                    half tHigh = smoothstep((1-audioDataHighs), (1-audioDataHighs) + 0.01, alMask.b) * alMask.a;
            
                    half4 emissionChannelRed = lerp(alMask.r, tLow, _ALGradientOnRed) * _ALPackedRedColor * audioDataBass;
                    half4 emissionChannelGreen = lerp(alMask.g, tMid, _ALGradientOnGreen) * _ALPackedGreenColor * audioDataMids;
                    half4 emissionChannelBlue = lerp(alMask.b, tHigh, _ALGradientOnBlue) * _ALPackedBlueColor * audioDataHighs;
                    half3 em = emissionChannelRed.rgb + emissionChannelGreen.rgb + emissionChannelBlue.rgb;
                    
                    #elif defined(AL_MODE_UV_BASED)
            
                    half2 aluv;
                    aluv = half2(alUV.x * _ALUVWidth, alUV.y);
                    half sampledAL = AudioLinkLerp(aluv).x;
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
                        
                    #else
                    half3 em = 0;
                    #endif
            
                    half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                    NoV = lerp(NoV, 1 - NoV, _ALEmissionDotMaskInvert);
                    NoV = saturate(pow(NoV, _ALEmissionDotMaskSmoothing));
                    o.Emission += lerp(em, em * NoV, _ALEmissionDotMask);
                }
            
                #endif
            }
            

            void ToonEmissionFragment(inout SurfaceData o) {
                #if defined(_EMISSION)
                half3 emission = SAMPLE_TEXTURE2D(_EmissionMap, sampler_MainTex, GLOBAL_uv).rgb;
                emission *= lerp(emission, emission * o.Albedo, _EmissionTintToDiffuse) * _EmissionColor;
                o.Emission += emission;
                #endif
                o.EmissionScaleWithLight = _EmissionScaleWithLight;
                o.EmissionLightThreshold = _EmissionScaleWithLightSensitivity;
            }
            

            void ToonRimLightFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMLIGHT_ON)
                    
                #ifndef USING_DIRECTIONAL_LIGHT
                    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(d.worldSpacePosition));
                #else
                    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
            
                half3 normal = 0;
                #if defined(PIXEL_NORMAL_SET)
                normal = GLOBAL_pixelNormal;
                #else
                normal = o.Normal;
                #endif
            
                half lightNoL = saturate(dot(normal, lightDir));
                half SVDNoN = abs(dot(d.svdn, normal));
            
                half rimIntensity = saturate((1 - SVDNoN)) * saturate(pow(lightNoL, _RimThreshold));
                rimIntensity = smoothstep(_RimRange - _RimSharpness, _RimRange + _RimSharpness, rimIntensity);
                half4 rim = rimIntensity * _RimIntensity;
            
                // Rim Light Env Tint
                half3 env = 0;
                #if defined(UNITY_PASS_FORWARDBASE)
                    env = getEnvReflection(d.worldSpaceViewDir.xyz, d.worldSpacePosition.xyz, normal, o.Smoothness, 5);
                #endif
                    
                o.RimLight = rim * _RimTint * lerp(1, half4(o.Albedo.rgb,1), _RimAlbedoTint) * lerp(1, half4(env.rgb,1), _RimEnvironmentTint);
                o.RimLight *= _RimTint.a;
                o.RimAttenuation = _RimAttenuation;
                    
                #endif
            }
            

            void ToonShadowRimFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMSHADOW_ON)
            
                Light mainLight = GetMainLight(0..xxxx, d.worldSpacePosition, 0..xxxx);
            
                float3 lightDir = mainLight.direction;
                    
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
                half lightNoL = saturate(dot(GLOBAL_pixelNormal, lightDir));
                half SVDNoN = abs(dot(d.svdn, GLOBAL_pixelNormal));
                half shadowRimIntensity = saturate((1 - SVDNoN)) * pow(1 - lightNoL, _ShadowRimThreshold * 2);
                shadowRimIntensity = smoothstep(_ShadowRimRange - _ShadowRimSharpness, _ShadowRimRange + _ShadowRimSharpness, shadowRimIntensity);
            
                o.RimShadow = lerp(1, (_ShadowRimTint * lerp(1, o.Albedo.rgbb, _ShadowRimAlbedoTint)), shadowRimIntensity);
            
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
                #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            bool ShouldReact() { return AudioLinkIsAvailable() && !_ChromaForceIdle; }
            
            float ChronoTime(int band)
            {
                if (ShouldReact()) return AudioLinkGetChronoTime(0, band);
                return _Time.x;
            }
            
            fixed3 ThemeColor(int theme)
            {
                theme %= 4;
                if (ShouldReact() && !_ChromaForceTheme)
                {
                    return AudioLinkData(ALPASS_THEME_COLOR0 + int2(theme, 0));
                } else switch (theme) {
                    case 0:
                        return _ChromaTheme0;
            
                    case 1:
                        return _ChromaTheme1;
            
                    case 2:
                        return _ChromaTheme2;
            
                    case 3:
                        return _ChromaTheme3;
            
                    default:
                        return 0.0;
                }
            }
            
            // float3 ThemeHue(float value)
            // {
            //     float scaledTime = value * 4.0;
            //     return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime));
            // }
            
            fixed3 ChromaEffect(int effect, int band, float progress, float value)
            {
                fixed dft = 0.0;
                if (effect > 8)
                    if (ShouldReact())
                    {
                        dft = AudioLinkLerpMultiline(ALPASS_DFT + float2(progress * AUDIOLINK_ETOTALBINS, 0.0)).g * 0.9;
                    } else
                        dft = (_Time.x * _ChromaSpeed) - progress;
            
                switch (effect)
                {
                    case 1: // Color Theme 1 to Color Theme 2
                        return lerp(ThemeColor(0), ThemeColor(1), progress) * value;
            
                    case 2: // Color Theme 3 to Color Theme 4
                        return lerp(ThemeColor(2), ThemeColor(3), progress) * value;
            
                    case 3: // Color Themes 1 - 4
                        float scaledTime = progress * 3.0;
                        return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime)) * value;
            
                    case 4: // Solid Hue Chronotensity
                        return HSV2RGB(float3(ChronoTime(band) * _ChromaSpeed, 1.0, value));
            
                    case 5: // Hue Value
                        return HSV2RGB(float3(ShouldReact() ? value : (_Time.x + .5 * _ChromaSpeed), 1.0, value));
            
                    case 6: // Hue Time Gradient
                        return HSV2RGB(float3((_Time.x * 2.0 * _ChromaSpeed) - progress, 1.0, value));
            
                    case 7: // Hue Time Gradient + Time Pulse Gradient
                        return HSV2RGB(float3(((_Time.y / 5.0) * _ChromaSpeed) - progress, 1.0, value * abs(sin((_Time.y * _ChromaSpeed) - (progress * 15.0)))));
            
                    case 8: // Hue Chronotensity Gradient
                        return HSV2RGB(float3((((ChronoTime(band) * _ChromaSpeed) + AudioLinkGetChronoTime(4, band)) * 0.33) - progress, 1.0, value));
            
                    case 9: // Waveform Hue
                        return HSV2RGB(float3(dft, 1.0, value));
            
                    case 10: // Warped Waveform Hue
                        return HSV2RGB(float3((sin((dft - progress) * UNITY_PI) + 1.0) / 2.0, 1.0, value));
            
                    default:
                        return 0.0;
                }
            }
            
            void ChromaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_AUDIOLINKCHROMA)
            
                    if (!_EnableAudioLinkChroma) return;
            
                    #if defined(_LUMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (!_ReactPriority) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _ChromaMask);
            
                    fixed4 mask = _ChromaMask.Sample(bilinear_clamp, uv);
                    #if defined(_CHROMAMAP)
                        fixed4 map = _ChromaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
            
                        int band = floor(clamp(mask.a * 4.0, 0.0, 3.99));
                    #else
                        uv = rotate(uv - 0.5, _ChromaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, clamp(uv.x, 0.0, 1.0));
            
                        int band = _ChromaBand;
                    #endif
                    map.a = pow(map.a, _ChromaWarp);
            
                    fixed value = 1.0;
                    if (ShouldReact()) value = AudioLinkLerp(float2(map.a * _ChromaHistory, band)).r;
            
                    fixed3 color = 0.0;
                    color += ChromaEffect(_ChromaModeR, band, map.a, value) * map.r;
                    #if defined(_CHROMAMAP)
                        color += ChromaEffect(_ChromaModeG, band, map.a, value) * map.g;
                        color += ChromaEffect(_ChromaModeB, band, map.a, value) * map.b;
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.114)), _ChromaBiased) * _ChromaTint * mask.rgb;
            
                    o.Emission += color;
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            fixed3 LumaGradient(int grad, fixed prog)
            {
                return AudioLinkLerp(float2(prog * 127.0, LUMA_START - (grad % LUMA_POWER)));
            }
            
            fixed3 LumaLegacyGradient(int grad, fixed prog)
            {
                #if defined(_LUMALEGACY)
                    if (grad < 4)
                    {
                        fixed2 theme = fixed2((grad / 2) * LUMA_LEGACY_THEME_SIZE, -(grad % 2) * LUMA_LEGACY_THEME_SIZE);
                        return _Stored.SampleLevel(bilinear_clamp, (LUMA_LEGACY_THEME_POSITION + theme) / LUMA_LEGACY_SIZE, 0);
                    } else {
                        prog = GRADSTART[grad - 4] + (LUMA_LEGACY_LENGTH * prog);
                        return _Stored.SampleLevel(bilinear_clamp, fixed2(prog, LUMA_LEGACY_Y) / LUMA_LEGACY_SIZE, 0);
                    }
                #endif
            
                return 0.0;
            }
            
            void LumaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_LUMA)
            
                    if (!_EnableLuma) return;
            
                    #if defined(_AUDIOLINKCHROMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (_ReactPriority) return;
                    #endif
            
                    #if defined(_LUMALEGACY)
                        if (!IsLumaAvailable() && !IsLumaLegacyAvailable()) return;
                    #else
                        if (!IsLumaAvailable()) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _LumaMask);
            
                    fixed4 mask = _LumaMask.Sample(bilinear_clamp, uv);
                    #if defined(_LUMAMAP)
                        fixed4 map = _LumaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
                    #else
                        uv = rotate(uv - 0.5, _LumaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, uv.x);
                    #endif
            
                    map.a = pow(map.a, _LumaWarp);
                    fixed3 color = 0.0;
            
                    #if defined(_LUMALEGACY)
                        if (IsLumaAvailable())
                        {
                            color += LumaGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        } else {
                            map.a = 1.0 - map.a;
                            color += LumaLegacyGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaLegacyGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaLegacyGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        }
                    #else
                        color += LumaGradient(_LumaGrad1, map.a) * map.r;
                        #if defined(_LUMAMAP)
                            color += LumaGradient(_LumaGrad2, map.a) * map.g;
                            color += LumaGradient(_LumaGrad3, map.a) * map.b;
                        #endif
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _LumaBiased) * _LumaTint * mask.rgb;
            
                    o.Emission += color;
            
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            void VideoFrag(MeshData d, inout SurfaceData o) {
            
                #if defined(_VIDEO)
                    if (!_EnableVideo) return;
            
                    float2 videouv = TRANSFORM_TEX(d.uv0, _VideoMask);
                    fixed4 video = 0.0;
            
                    #if defined(_VIDEOMAP)
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                        videouv = _VideoMap.SampleLevel(bilinear_clamp, videouv, 0).rg;
                    #else
                        videouv -= 0.5;
                        videouv = rotate(videouv, _VideoRotation);
                        videouv.y *= _VideoRatio;
                        videouv += 0.5;
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                    #endif
            
            
            
                    if (videouv.x > 0.0 && videouv.x < 1.0 && videouv.y > 0.0 && videouv.y < 1.0 && any(mask > 0.01))
                    {
                        if (IsVideoAvailable())
                        {
                            #if defined(_VIDEOAST)
                                videouv = TRANSFORM_TEX(videouv, _Udon_VideoTex);
                            #endif
                            video.rgb = _Udon_VideoTex.SampleLevel(bilinear_clamp, videouv, 0);
                        } else video.rgb = _VideoFallback.SampleLevel(bilinear_clamp, videouv, 0);
            
                        fixed3 videocolor = video.rgb * mask.rgb * _VideoTint.rgb;
                        #if defined(_VIDEOALBEDO)
                            o.Albedo.rgb = lerp(o.Albedo.rgb, videocolor, _VideoTint.a);
                        #else
                            o.Emission += videocolor;
                        #endif
                    }
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            fixed4 SampleCrowdwave(float3 objectPos)
            {
            
                float2 position = mul(unity_ObjectToWorld, float4(objectPos, 1.0)).xz;
            
                float2 worldPosition = _Udon_CrowdwaveMeta._m20_m21_m22_m23.xz;
                float4 screenBounds = _Udon_CrowdwaveMeta._m00_m01_m02_m03;
                float2 worldBounds = _Udon_CrowdwaveMeta._m10_m11_m12_m13.xy;
                fixed worldRotation = _Udon_CrowdwaveMeta._m20_m21_m22_m23.w;
                half intensity = _Udon_CrowdwaveMeta._m10_m11_m12_m13.z;
                //_Udon_CrowdwaveMeta._m10_m11_m12_m13.w;
                //_Udon_CrowdwaveMeta._m30_m31_m32_m33;
            
                intensity = intensity > 1.0 ? intensity - 1.0 : 0.0;
            
                position -= worldPosition;
                position.xy = rotate(position.xy, worldRotation);
                position.xy += worldBounds / 2.0;
                position.xy /= worldBounds;
            
                half mask = _Udon_CrowdwaveMask.SampleLevel(sampler_Udon_CrowdwaveMask, position.xy, 0);
                if (!IsVideoAvailable() || position.x < 0.0 || position.x > 1.0 || position.y < 0.0 || position.y > 1.0) mask = 0.0;
            
                position.xy *= screenBounds.xy;
                position.xy += screenBounds.zw;
            
                fixed3 color = _Udon_VideoTex.SampleLevel(bilinear_clamp, position.xy, 0) * intensity * mask;
            
                return fixed4(color.xyz, mask);
            
            }
                
            void CrowdwaveFrag(MeshData d, inout SurfaceData o)
            {
            
                #if defined(_CROWDWAVE)
                    if (!_EnableCrowdwave) return;
            
                    half3 crowdwaveMask = _CrowdwaveMask.Sample(sampler_CrowdwaveMask, TRANSFORM_TEX(d.uv0, _CrowdwaveMask));
            
                    #if defined(_CROWDWAVERANGE)
                        fixed3 color = SampleCrowdwave(d.localSpacePosition).rgb;
                    #else
                        fixed3 color = SampleCrowdwave(0.0).rgb;
                    #endif
            
                    o.Emission += lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _CrowdwaveBias) * _CrowdwaveTint * crowdwaveMask;
                #endif
            }
            

            void LTCGICustomGI(MeshData d, SurfaceData o, inout half3 indirectSpecular, inout half3 indirectDiffuse)
            {
                #if !defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            o.Normal.xyz,
                            d.worldSpaceViewDir,
                            saturate((1 - o.Smoothness) + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            indirectSpecular += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            indirectSpecular += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        indirectDiffuse += ltcgiData.diffuse * _LTCGIDiffuseIntensity;
                    #endif
                }
                #endif
            }
            

            void LTCGIColor(MeshData d, FragmentData i, inout SurfaceData o, inout half4 FinalColor, bool facing)
            {
                #if defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        #if defined(PASS_OUTLINE)
                        return;
                        #endif
            
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        float3 viewDir = d.worldSpaceViewDir;
                        if (!facing)
                        {
                            viewDir = -d.worldSpaceViewDir;
                        }
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            d.worldNormal.xyz,
                            viewDir,
                            saturate(0.5 + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            FinalColor.rgb += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            FinalColor.rgb += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        half3 rampHSV = RGB2HSV(ltcgiData.diffuse);
                        rampHSV.z = tanh(rampHSV.z);
                        rampHSV.z = SAMPLE_TEXTURE2D(_LTCGIRamp, sampler_LTCGIRamp, half2(rampHSV.z, 0)).r;
                        FinalColor.rgb += HSV2RGB(rampHSV) * o.Albedo * _LTCGIDiffuseIntensity;
                        if (_LTCGIAlphaPremultiply)
                        {
                            FinalColor.rgb *= FinalColor.a;
                        }
                    #endif
                }
                #endif
            }
            

            void Toon_SheenFragment(MeshData d, inout SurfaceData o) {
                half sheenMask = _SheenMask.SampleLevel(sampler_SheenMask, TRANSFORM_TEX(d.uv0, _SheenMask), 0).r;
                if (sheenMask < 0.5) return;
            
                half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                NoV = saturate(pow(NoV, _SheenPower));
                half3 blendSource = lerp(_SheenTint, o.Albedo, _SheenAlbedoTint);
                half3 blended = blendSource;
                switch (_SheenBlendType)
                {
                    case 0: blended = BlendOverlay(o.Albedo, blendSource * NoV); break;
                    case 1: blended = BlendLighten(o.Albedo, blendSource * NoV); break;
                    case 2: blended = BlendScreen(o.Albedo, blendSource * NoV); break;
                    case 3: blended = o.Albedo * blendSource * NoV; break;
                }
                o.Albedo = lerp(o.Albedo, blended, _SheenStrength);
            
            }
            

            void VRCFeaturesVertex(inout VertexData v)
            {
                #if defined(VRC_FEATURES)
                bool isInVRHandCam = _VRChatCameraMode == 1;
                bool isInDesktopHandCam = _VRChatCameraMode == 2;
                bool isInVR = isVR();
                bool isInDesktop = !isInVR && !isInDesktopHandCam;
                bool isInVRMirror = _VRChatMirrorMode == 1;
                bool isInDesktopMirror = _VRChatMirrorMode == 2;
            
                if (_VRCHideInVR && isInVR)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktop && isInDesktop)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRCamera && isInVRHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopCamera && isInDesktopHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRMirror && isInVRMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopMirror && isInDesktopMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                #endif
            }
            

            half4 calcRamp(half NdL, half attenuation, half occlusion, int occlusionMode)
            {
                half remapRamp;
                remapRamp = NdL * 0.5 + 0.5;
                remapRamp *= lerp(1, occlusion, occlusionMode);
                #if defined(UNITY_PASS_FORWARDBASE)
                remapRamp *= attenuation;
                #endif
                half4 ramp = SAMPLE_TEXTURE2D(_Ramp, sampler_Ramp, half2(remapRamp, 0));
                return ramp;
            }
            
            half3 calcIndirectSpecular(half lightAttenuation, MeshData d, SurfaceData o, half roughness, half3 reflDir, half3 indirectLight, float3 fresnel, half4 ramp)
            {
                half3 spec = half3(0,0,0);
            
                #if defined(REFLECTION_MODE_OFF)
                return spec;
                #endif
            
                #if defined(REFLECTION_MODE_MATCAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    spec = o.BakedReflection;
                    if(o.ReflectionBlendMode != 1)
                    {
                        spec *= (indirectLight + (_LightColor0 * lightAttenuation) * 0.5);
                    }
                }
                #endif
            
                #if defined(REFLECTION_MODE_PBR) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 reflectionUV1 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
            
                    half3 indirectSpecular;
                    half interpolator = unity_SpecCube0_BoxMin.w;
            
                    UNITY_BRANCH
                    if (interpolator < 0.99999)
                    {
                        half3 reflectionUV2 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                        half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                        indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
                    }
                    else
                    {
                        indirectSpecular = probe0sample;
                    }
            
                    if (!any(indirectSpecular))
                    {
                        indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        indirectSpecular *= indirectLight;
                    }
                    spec = indirectSpecular * fresnel;
                }
                #endif
            
                #if defined(REFLECTION_MODE_BAKED_CUBEMAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    indirectSpecular *= indirectLight;
                    spec = indirectSpecular * fresnel;
                }
                #endif
                return spec;
            }
            
            half3 calcDirectSpecular(MeshData d, SurfaceData o, float lightNoL, float NoH, float NoV, float lightLoH, half3 lightColor, half3 lightHalfVector, half anisotropy)
            {
                half specularIntensity = o.SpecularIntensity;
                half3 specular = half3(0,0,0);
                half smoothness = max(0.01, (o.SpecularArea));
                smoothness *= 1.7 - 0.7 * smoothness;
            
                float rough = max(smoothness * smoothness, 0.0045);
                float Dn = D_GGX(NoH, rough);
                float3 F = 1-F_Schlick(lightLoH, 0);
                float V = V_SmithGGXCorrelated(NoV, lightNoL, rough);
                float3 directSpecularNonAniso = max(0, (Dn * V) * F);
            
                anisotropy *= saturate(5.0 * smoothness);
                float at = max(rough * (1.0 + anisotropy), 0.001);
                float ab = max(rough * (1.0 - anisotropy), 0.001);
                float D = D_GGX_Anisotropic(NoH, lightHalfVector, d.worldSpaceTangent, d.bitangent, at, ab);
                float3 directSpecularAniso = max(0, (D * V) * F);
            
                specular = lerp(directSpecularNonAniso, directSpecularAniso, saturate(abs(anisotropy * 100)));
                specular = lerp(specular, smoothstep(0.5, 0.51, specular), o.SpecularSharpness) * 3 * lightColor.xyz * specularIntensity; // Multiply by 3 to bring up to brightness of standard
                specular *= lerp(1, o.Albedo, o.SpecularAlbedoTint);
                specular = clamp(specular, 0, specularIntensity);
                return specular;
            }
            
            half3 calcReflectionBlending(SurfaceData o, half reflectivity, half3 col, half3 indirectSpecular)
            {
                half3 reflection = indirectSpecular.xyzz * reflectivity;
            
                // Doing a Lerp allows shaders to smoothly transition between blend modes
                col = lerp(
                    col + reflection, // Additive
                    lerp(
                        lerp(col, col * indirectSpecular.xyz, reflectivity), // Multiplicitive
                        col - reflection, // Subtractive
                        saturate(o.ReflectionBlendMode - 1)
                    ),
                    saturate(o.ReflectionBlendMode)
                );
                return col;
            }
            
            half4 calcEmission(SurfaceData o, half lightAvg)
            {
                #if defined(UNITY_PASS_FORWARDBASE) // Emission only in Base Pass, and vertex lights
                    float4 emission = 0;
                    emission = half4(o.Emission, 1);
            
                    half intensity = length(emission.rgb);
                    half3 emissionHSV = RGB2HSV(normalize(emission.rgb));
                    emissionHSV.x = fmod(emissionHSV.x + o.Hue, 1);
                    emissionHSV.y = saturate(emissionHSV.y + o.Saturation);
                    emissionHSV.z = saturate(emissionHSV.z + o.Value);
                    emission.rgb = HSV2RGB(emissionHSV) * intensity;
            
                    float4 scaledEmission = emission * saturate(smoothstep(1 - o.EmissionLightThreshold, 1 + o.EmissionLightThreshold, 1 - lightAvg));
                    float4 em = lerp(emission, scaledEmission, o.EmissionScaleWithLight);
                    return em;
                #else
                    return 0;
                #endif
            }
            
            void XSToonLighting(MeshData d, FragmentData i, SurfaceData o, inout half4 FinalColor)
            {
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half reflectance = o.Reflectivity;
                float oneMinusReflectivity = 1.0 - 0.04 - o.Metallic * (1.0 - 0.04);
                half3 f0 = 0.16 * reflectance * reflectance * (1 - o.Metallic) + o.Albedo * o.Metallic;
                half3 indirectDiffuse = 1;
                half3 indirectSpecular = 0;
                half3 directSpecular = 0;
                half occlusion = o.Occlusion;
                half perceptualRoughness = 1 - o.Smoothness;
                half3 tangentNormal = o.Normal;
                o.Normal = normalize(mul(o.Normal, d.TBNMatrix));
                half3 reflDir = calcReflView(d.worldSpaceViewDir, o.Normal);
            
                // Light Direction, based on method derived by Xiexe and Merlin
                #ifndef USING_DIRECTIONAL_LIGHT
                    half3 lightDir = UnityWorldSpaceLightDir(d.worldSpacePosition);
                #else
                    half3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
            
                half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                lightDir = (lightDir + probeLightDir);
            
                #if !defined(POINT) && !defined(SPOT)
                if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
                {
                    lightDir = half4(1, 1, 1, 0);
                }
                #endif
                lightDir = Unity_SafeNormalize(lightDir);
            
                // Attenuation
                UNITY_LIGHT_ATTENUATION(lightAttenuation, i, d.worldSpacePosition);
            
                // fix for rare bug where light atten is 0 when there is no directional light in the scene
                #ifdef UNITY_PASS_FORWARDBASE
                    if(all(_LightColor0.rgb == 0.0))
                        lightAttenuation = 1.0;
                #endif
            
                #if defined(USING_DIRECTIONAL_LIGHT)
                    half sharp = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, lightAttenuation); //Converge at the center line
                #endif
            
                half3 lightColor = _LightColor0.rgb;
            
                half3 lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                half lightNoL = dot(o.Normal, lightDir);
                half lightLoH = dot(lightDir, lightHalfVector);
            
                half NoV = abs(dot(o.Normal, d.worldSpaceViewDir)) + 1e-5;
                half NoH = saturate(dot(o.Normal, lightHalfVector));
                half3 stereoViewDir = calcStereoViewDir(d.worldSpacePosition);
                half NoSVDN = abs(dot(stereoViewDir, o.Normal));
            
                // Aniso Refl
                half3 reflViewAniso = 0;
            
                float3 anisotropicDirection = o.Anisotropy >= 0.0 ? d.bitangent : d.worldSpaceTangent.xyz;
                float3 anisotropicTangent = cross(anisotropicDirection, d.worldSpaceViewDir);
                float3 anisotropicNormal = cross(anisotropicTangent, anisotropicDirection);
                float bendFactor = abs(o.Anisotropy) * saturate(5.0 * perceptualRoughness);
                float3 bentNormal = normalize(lerp(o.Normal, anisotropicNormal, bendFactor));
                reflViewAniso = reflect(-d.worldSpaceViewDir, bentNormal);
            
                // Indirect diffuse
                #if !defined(LIGHTMAP_ON)
                    half3 L0 = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
                    indirectDiffuse.r = shEvaluateDiffuseL1Geomerics(L0.r, unity_SHAr.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.g = shEvaluateDiffuseL1Geomerics(L0.g, unity_SHAg.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.b = shEvaluateDiffuseL1Geomerics(L0.b, unity_SHAb.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse = max(0, indirectDiffuse);
                #elif defined(UNITY_PASS_FORWARDBASE)
                    // This here is an attempt to provide a somewhat usable ramp for lightmaps
                    half2 lightmapUV = d.lightmapUv.xy;
                    half4 bakedColorTex = 0;
                    half3 lightMap = tex2DFastBicubicLightmap(lightmapUV, bakedColorTex);
            
                    // Support basic directionality
                    #if defined(DIRLIGHTMAP_COMBINED)
                        half4 lightMapDirection = tex2DFastBicubicSample(unity_LightmapInd, samplerunity_Lightmap, lightmapUV);
            
                        // use lightmap direction if we can, realtim light is ignored in that case
                        lightDir.xyz = lightMapDirection.xyz - 0.5;
                        lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                        lightNoL = dot(o.Normal, lightDir);
                        lightLoH = dot(lightDir, lightHalfVector);
            
                        lightMap = DecodeDirectionalLightmap(lightMap, lightMapDirection, o.Normal);
            
                        lightColor = lightMap * 0.6;
                        indirectDiffuse = lightMap * 0.4;
                    #else
                        // Hacky way to support both cases of dirlight + baked and bakedy only but no directionality
                        // baked generates a light dir of 0,1,0
                        if (dot(lightDir.xyz, half3(0,1,0)) > 0.95) {
                            lightDir.xyz = 0;
                            lightNoL = 1;
                        }
                        indirectDiffuse = lightMap;
                    #endif
            
                    // we can end up using this twice, once above in the Dirlight logic and once here if both a realtime light
                    // and baked lightmap are present
                    half sharp2 = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, saturate(length(lightMap)));
                #endif
                indirectDiffuse *= lerp(occlusion, 1, o.OcclusionMode);
            
                if (_MonochromeLighting > 0)
                {
                    indirectDiffuse = lerp(indirectDiffuse, dot(indirectDiffuse, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
            
                bool lightEnv = any(lightDir.xyz);
                // if there is no realtime light - we rely solely on probes
                if (!lightEnv) {
                    lightColor = indirectDiffuse * 0.6;
                    indirectDiffuse = indirectDiffuse * 0.4;
                }
            
                #if defined(UNITY_PASS_FORWARDBASE)
                indirectDiffuse = lerp(indirectDiffuse, max(indirectDiffuse, 0.05), _MinLight);
                #endif
            
                half lightAvg = (dot(indirectDiffuse.rgb, grayscaleVec) + dot(lightColor.rgb, grayscaleVec)) / 2;
            
                // Light Ramp
                half4 ramp = 1;
                half4 diffuse = 1;
                ramp = calcRamp(lightNoL, lightAttenuation, occlusion, o.OcclusionMode);
                // Begin Added
                if (_MonochromeLighting > 0)
                {
                    lightColor = lerp(lightColor, dot(lightColor, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
                // End Added
                diffuse = calcDiffuse(lightAttenuation, o.Albedo.rgb, indirectDiffuse, lightColor, ramp);
            
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                float4 vLightAttenuations = 0;
                float4x4 vLightColors = getVertexLightsColors(d.worldSpacePosition, o.Normal, vLightAttenuations, false);
                float4x4 vLightDirections = getVertexLightsDir(d.worldSpacePosition);
                float4x4 vLightHalfVectors = 0;
                float4 vLightNoLs = 0;
                float4 vLightLoHs = 0;
                half4 vRamp = 1;
            
                [unroll(4)]
                for (int i = 0; i < 4; i++)
                {
                    vLightHalfVectors[i].rgb = Unity_SafeNormalize(vLightDirections[i] + d.worldSpaceViewDir);
                    vLightLoHs[i] = saturate(dot(vLightDirections[i], vLightHalfVectors[i]));
                    vLightNoLs[i] = saturate(dot(o.Normal, vLightDirections[i]));
                    vRamp = calcRamp(vLightNoLs[i], vLightAttenuations[i], occlusion, o.OcclusionMode);
                    diffuse += calcDiffuse(vLightAttenuations[i], o.Albedo.rgb, 0, vLightColors[i], vRamp);
                }
                #endif
            
                // Rims
                half3 rimLight = 0;
                #if defined(RIMLIGHT_ON)
                rimLight = o.RimLight.rgb;
                rimLight *= lightColor.xyz + indirectDiffuse.xyz;
                rimLight *= lerp(1, lightAttenuation + indirectDiffuse.xyz, o.RimAttenuation);
                #endif
            
                half3 rimShadow = 1;
                #if defined(RIMSHADOW_ON)
                rimShadow = o.RimShadow;
                #endif
            
                float3 fresnel = F_Schlick(NoV, f0);
            
                #if !defined(REFLECTION_MODE_OFF)
                indirectSpecular = calcIndirectSpecular(lightAttenuation, d, o, perceptualRoughness, reflViewAniso, indirectDiffuse, fresnel, ramp) * occlusion;
                #endif
            
                #if defined(SPECULAR_ON)
                directSpecular = calcDirectSpecular(d, o, lightNoL, NoH, NoV, lightLoH, lightColor, lightHalfVector, o.SpecularAnisotropy) * lightNoL * occlusion * lightAttenuation;
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                {
                    [unroll(4)]
                    for (int i = 0; i < 4; i++)
                    {
                        directSpecular += calcDirectSpecular(d, o, vLightNoLs[i], vLightLoHs[i], NoV, vLightLoHs[i], vLightColors[i], vLightHalfVectors[i], o.SpecularAnisotropy) * vLightNoLs[i] * occlusion * vLightAttenuations[i];
                    }
                }
                #endif
                #endif
            
                // Standard-Like transparent (premult alpha)
                if (_RenderType == 2)
                {
                    diffuse.rgb *= o.Alpha;
                    o.Alpha = 1 - (oneMinusReflectivity) + o.Alpha * (oneMinusReflectivity);
                }
            
                #if !defined(_NATIVE_A2C)
                {
                    // Standard-Like cutout
                    if (_RenderType == 1)
                    {
                        clip(o.Alpha - _Cutoff);
                    }
                }
                #endif
            
                FinalColor.rgb = diffuse.rgb * rimShadow.rgb;
            
                #if !defined(REFLECTION_MODE_OFF)
                FinalColor.rgb = calcReflectionBlending(o, reflectance, FinalColor.rgb, indirectSpecular);
                #endif
            
                FinalColor.rgb += max(directSpecular.xyz, rimLight.rgb).rgb;
                FinalColor.rgb += calcEmission(o, lightAvg);
            
                // Outline
                #if defined(PASS_OUTLINE)
                    half3 outlineColor = 0;
                    half3 ol = o.OutlineColor;
                    outlineColor = ol * saturate(lightAttenuation * lightNoL) * lightColor.rgb;
                    outlineColor += indirectDiffuse * ol;
                    outlineColor = lerp(outlineColor, ol, o.OutlineLightingMode);
                    FinalColor.rgb = outlineColor;
                #endif
            
                FinalColor.a = o.Alpha;
            
                // Premulty output by alpha for correct `Fade` mode
                #if defined(UNITY_PASS_FORWARDADD)
                if (_RenderType == 3)
                {
                    FinalColor.rgb *= o.Alpha;
                }
                #endif
            
                #endif
            }
            

            void VertexBase(inout VertexData v, inout FragmentData o)
            {
                #if defined(UNITY_PASS_META) && !defined(UNITY_PASS_BAKERY_META)
                o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
                #else
                o.pos = TransformObjectToHClip(v.vertex);
                #endif
                o.normal = v.normal;
                o.uv0 = v.uv0;
                o.uv1 = v.uv1;
                o.uv2 = v.uv2;
                o.uv3 = v.uv3;
                #if defined(NEED_UV4)
                o.uv4 = v.uv4;
                #endif
                #if defined(NEED_UV5)
                o.uv5 = v.uv5;
                #endif
                #if defined(NEED_UV6)
                o.uv6 = v.uv6;
                #endif
                #if defined(NEED_UV7)
                o.uv7 = v.uv7;
                #endif
                o.worldPos = mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1));
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldTangent.xyz = UnityObjectToWorldDir(v.tangent.xyz);
                o.worldTangent.w = v.tangent.w * unity_WorldTransformParams.w;
                o.vertexColor = v.color;
            
                #if defined(EDITOR_VISUALIZATION)
                o.vizUV = 0;
                o.lightCoord = 0;
                if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
                {
                    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.uv0.xy, v.uv1.xy, v.uv2.xy, unity_EditorViz_Texture_ST);
                }
                else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
                {
                    o.vizUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
                }
                #endif
            
                #if defined(NEED_SCREEN_POS)
                o.screenPos = GetScreenPosition(o.pos);
                o.screenPos.z = -TransformWorldToView(TransformObjectToWorld(v.vertex)).z;
                #endif
            
                #if !defined(UNITY_PASS_META)
                    #if defined(LIGHTMAP_ON)
                    o.lightmapUv.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    #endif
                    #if defined(DYNAMICLIGHTMAP_ON)
                    o.lightmapUv.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                    #endif
                        
                    UNITY_TRANSFER_LIGHTING(o, v.uv1.xy);
                    
                    #if !defined(UNITY_PASS_FORWARDADD)
                        // unity does some funky stuff for different platforms with these macros
                        #ifdef FOG_COMBINED_WITH_TSPACE
                            UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o, o.pos);
                        #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                            UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o, o.pos);
                        #else
                            UNITY_TRANSFER_FOG(o, o.pos);
                        #endif
                    #else
                        UNITY_TRANSFER_FOG(o, o.pos);
                    #endif
                #endif
            }
            

            // Free Functions

            // ShadowCaster Vertex
            #if !defined(TESS_ENABLED)
            FragmentData Vertex(VertexData v)
            {
                UNITY_SETUP_INSTANCE_ID(v);
                FragmentData o;
                UNITY_INITIALIZE_OUTPUT(FragmentData, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);

                // ShadowCaster Vertex Chain
                VRCFeaturesVertex(v);

                ToonOutlineVertex(v);

                AudioLinkVertex(v);

                // ShadowCaster VertexBase
                VertexBase(v, o);

                // ShadowCaster PostVertex Chain

                TRANSFER_SHADOW_CASTER_NORMALOFFSET(o);

                return o;
            }
            #endif

            // ShadowCaster Fragment
            half4 Fragment(FragmentData i, bool facing: SV_IsFrontFace) : SV_TARGET
            {
                UNITY_SETUP_INSTANCE_ID(i);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);

                #if defined(NEED_FRAGMENT_IN_SHADOW)
                SurfaceData o = CreateSurfaceData();
                MeshData d = CreateMeshData(i, facing);
                half4 FinalColor = 1;

                // ShadowCaster Fragment Chain
                ToonMainFragment(d, o, facing);

                ToonOcclusionFragment(d, o);

                ToonNormalsFragment(d, o);

                ToonOutlineFragment(d, o);

                ToonSpecularFragment(d, o);

                ToonReflectionFragment(d, o);

                ToonALFragment(d, o);

                ToonEmissionFragment(o);

                ToonRimLightFragment(d, o);

                ToonShadowRimFragment(d, o);

                ChromaFrag(d, o);

                LumaFrag(d, o);

                VideoFrag(d, o);

                CrowdwaveFrag(d, o);

                Toon_SheenFragment(d, o);

                FinalColor = 1;

                // ShadowCaster Color Chain
                LTCGIColor(d, i, o, FinalColor, facing);
                #endif


                SHADOW_CASTER_FRAGMENT(i);
            }

            ENDCG
            // ShadowCaster Pass End
        }

        Pass
        {
            Name "Outline"
            Tags { "LightMode" = "ForwardBase"  }
            Cull Front
            Stencil {
                Ref 69
                Comp [_StencilOutlineComp]
                Pass Zero
                Fail Zero
            }

            // Outline Pass Start
            CGPROGRAM
            #pragma target 4.5
            #pragma multi_compile_instancing
            #pragma multi_compile_fwdbase
            #pragma multi_compile_fog
            #pragma vertex Vertex
            #pragma fragment Fragment
            #pragma shader_feature_local_fragment _NATIVE_A2C
            
            #pragma shader_feature_local_fragment SEPARATE_ALPHA
            
            #pragma shader_feature _AUDIOLINKVERTEX
            
            #pragma shader_feature_local_fragment NORMALS_SET
            #pragma shader_feature_local_fragment DETAIL_NORMALS_SET
            
            #pragma shader_feature_local OUTLINE_ENABLED
            
            #pragma shader_feature_local_fragment SPECULAR_ON
            
            #pragma shader_feature_local_fragment REFLECTION_MODE_OFF REFLECTION_MODE_PBR REFLECTION_MODE_BAKED_CUBEMAP REFLECTION_MODE_MATCAP
            
            #pragma shader_feature_local_fragment AL_MODE_SINGLE_CHANNEL AL_MODE_PACKED_MAP AL_MODE_UV_BASED
            #if !defined(AL_MODE_SINGLE_CHANNEL) && !defined(AL_MODE_PACKED_MAP) && !defined(AL_MODE_UV_BASED)
                #define AL_MODE_NONE
            #endif
            
            #pragma shader_feature_local_fragment _EMISSION
            
            #pragma shader_feature_local_fragment RIMLIGHT_ON
            
            #pragma shader_feature_local_fragment RIMSHADOW_ON
            
            #pragma shader_feature _AUDIOLINKCHROMA
            #pragma shader_feature _CHROMAMAP
            
            #pragma shader_feature _LUMA
            #pragma shader_feature _LUMALEGACY
            #pragma shader_feature _LUMAMAP
            
            #pragma shader_feature _VIDEO
            #pragma shader_feature _VIDEOMAP
            #pragma shader_feature _VIDEOAST
            #pragma shader_feature _VIDEOALBEDO
            
            #pragma shader_feature _CROWDWAVE
            #pragma shader_feature _CROWDWAVERANGE
            
            #pragma shader_feature_local_fragment INTEGRATE_LTCGI
            
            #pragma shader_feature_local_vertex VRC_FEATURES
            
            #pragma multi_compile _ VERTEXLIGHT_ON

            #define UNITY_INSTANCED_LOD_FADE
            #define UNITY_INSTANCED_SH
            #define UNITY_INSTANCED_LIGHTMAPSTS

            #ifndef PASS_OUTLINE
                #define PASS_OUTLINE
            #endif

            // ShaderDefines
            #define NEED_FRAGMENT_IN_SHADOW
            #define NEED_ALBEDO_ALPHA
            
            #define GLOBAL_UV_SET
            
            #define PIXEL_NORMAL_SET
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #ifndef LUMACONFIG
                #define LUMACONFIG
            
                #define LUMA_START 63
                #define LUMA_POWER 7
            
                #if defined(_LUMALEGACY)
                    #define LUMA_LEGACY_WIDTH 1920.0
                    #define LUMA_LEGACY_HEIGHT 1080.0
                    #define LUMA_LEGACY_SIZE fixed2(LUMA_LEGACY_WIDTH, LUMA_LEGACY_HEIGHT)
            
                    #define LUMA_LEGACY_LENGTH 200.0
                    #define LUMA_LEGACY_Y 533.0 // 547.0
            
                    #define LUMA_LEGACY_POWER_POSITION fixed2(1205.0, 553.0) //527.0 //fixed2(0.629, 0.511)
                    #define LUMA_LEGACY_THEME_POSITION fixed2(1645.0, 566.0) // 514.0
                    #define LUMA_LEGACY_THEME_SIZE 15.0
            
                    #define LUMA_LEGACY_GRAD_START1 1097.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START2 1309.0 - 1.0
                    #define LUMA_LEGACY_GRAD_START3 1522.0
                #endif
            #endif
            
            #if defined(INTEGRATE_LTCGI)
                #define _INTEGRATE_CUSTOMGI_FLEX
            #endif
            
            #define INCLUDE_LTCGI defined(INTEGRATE_LTCGI)
            
            #if INCLUDE_LTCGI
                #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI_structs.cginc"
            #endif
            
            #define ORL_LIGHTING_MODEL_TOON
            
            #if defined(UNITY_PBS_USE_BRDF2) || defined(SHADER_API_MOBILE)
                #define PLAT_QUEST
            #else
                #ifdef PLAT_QUEST
                    #undef PLAT_QUEST
                #endif
            #endif
            
            #define NEED_SCREEN_POS
            
            #define grayscaleVec float3(0.2125, 0.7154, 0.0721)
            // DataStructs
            struct VertexData
            {
                float4 vertex : POSITION;
                float3 normal : NORMAL;
                float4 tangent : TANGENT;
                float4 color : COLOR;
                float4 uv0 : TEXCOORD0;
                float4 uv1 : TEXCOORD1;
                float4 uv2 : TEXCOORD2;
                float4 uv3 : TEXCOORD3;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD7;
                #endif
                UNITY_VERTEX_INPUT_INSTANCE_ID
            };
            
            struct FragmentData
            {
                #if defined(UNITY_PASS_SHADOWCASTER)
                V2F_SHADOW_CASTER;
                #else
                float4 pos : SV_POSITION;
                #endif
                    
                float3 normal : RAW_NORMAL;
                float4 uv0 : TEXCOORD1;
                float4 uv1 : TEXCOORD2;
                float4 uv2 : TEXCOORD3;
                float4 uv3 : TEXCOORD4;
                #if defined(NEED_UV4)
                float4 uv4 : TEXCOORD5;
                #endif
                #if defined(NEED_UV5)
                float4 uv5 : TEXCOORD6;
                #endif
                #if defined(NEED_UV6)
                float4 uv6 : TEXCOORD7;
                #endif
                #if defined(NEED_UV7)
                float4 uv7 : TEXCOORD8;
                #endif
                float3 worldPos : WORLD_POS;
                float3 worldNormal : WORLD_NORMAL;
                float4 worldTangent : WORLD_TANGENT;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                float4 lightmapUv : LM_UV;
                #endif
                centroid float4 vertexColor : VERTEX_COLOR;
            
                #if !defined(UNITY_PASS_META)
                UNITY_LIGHTING_COORDS(9, 10)
                UNITY_FOG_COORDS(11)
                #endif
            
                #if defined(EDITOR_VISUALIZATION)
                float2 vizUV : VIZ_UV;
                float4 lightCoord : LIGHT_COORD;
                #endif
                  
                #if defined(NEED_SCREEN_POS)
                float4 screenPos: SCREENPOS;
                #endif
            
                #if defined(EXTRA_V2F_0)
                float4 extraV2F0 : EXTRA_V2F_BLOCK0;
                #endif
                #if defined(EXTRA_V2F_1)
                float4 extraV2F1 : EXTRA_V2F_BLOCK1;
                #endif
                #if defined(EXTRA_V2F_2)
                float4 extraV2F2 : EXTRA_V2F_BLOCK2;
                #endif
                #if defined(EXTRA_V2F_3)
                float4 extraV2F3 : EXTRA_V2F_BLOCK3;
                #endif
            
                // Additional Fragment Data
                
                // Additional Fragment Data End
            
                UNITY_VERTEX_INPUT_INSTANCE_ID
                UNITY_VERTEX_OUTPUT_STEREO
            };
            
            struct LTCGIAccumulatorStruct {
                float3 diffuse;
                float3 specular;
            };
            
            #define LTCGI_V2_CUSTOM_INPUT LTCGIAccumulatorStruct
            
            struct MeshData
            {
                float4 uv0;
                float4 uv1;
                float4 uv2;
                float4 uv3;
                #if defined(NEED_UV4)
                float4 uv4;
                #endif
                #if defined(NEED_UV5)
                float4 uv5;
                #endif
                #if defined(NEED_UV6)
                float4 uv6;
                #endif
                #if defined(NEED_UV7)
                float4 uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half4 lightmapUv;
                #endif
                half4 vertexColor;
                half3 normal;
                half3 worldNormal;
                half3 localSpacePosition;
                half3 worldSpacePosition;
                half3 worldSpaceViewDir;
                half3 worldSpaceTangent;
                half3 tangentSpaceViewDir;
                float3x3 TBNMatrix;
                half3 bitangent;
                half3 svdn;
                float4 extraV2F0;
                float4 extraV2F1;
                float4 extraV2F2;
                float4 extraV2F3;
                float4 screenPos;
            
                // Additional Mesh Data
                
                // Additional Mesh Data End
            };
            
            MeshData CreateMeshData(FragmentData i, bool facing)
            {
                MeshData d = (MeshData) 0;
                d.uv0 = i.uv0;
                d.uv1 = i.uv1;
                d.uv2 = i.uv2;
                d.uv3 = i.uv3;
                #if defined(NEED_UV4)
                d.uv4 = i.uv4;
                #endif
                #if defined(NEED_UV5)
                d.uv5 = i.uv5;
                #endif
                #if defined(NEED_UV6)
                d.uv6 = i.uv6;
                #endif
                #if defined(NEED_UV7)
                d.uv7 = i.uv7;
                #endif
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.lightmapUv = i.lightmapUv;
                #endif
                d.worldNormal = normalize(i.worldNormal);
                d.localSpacePosition = mul(unity_WorldToObject, float4(i.worldPos, 1)).xyz;
                d.worldSpacePosition = i.worldPos;
                d.worldSpaceViewDir = normalize(_WorldSpaceCameraPos - i.worldPos);
            
                d.normal = i.normal;
                d.vertexColor = i.vertexColor;
            
                #if !defined(UNITY_PASS_SHADOWCASTER)
                d.bitangent = normalize(cross(i.worldTangent.xyz, d.worldNormal) * i.worldTangent.w * - 1);
                d.worldSpaceTangent = normalize(i.worldTangent.xyz);
                d.TBNMatrix = float3x3(normalize(i.worldTangent.xyz), d.bitangent, d.worldNormal);
                d.TBNMatrix[2].xyz *= facing ? 1 : -1;
                d.tangentSpaceViewDir = mul(d.TBNMatrix, d.worldSpaceViewDir);
                #endif
            
                #if UNITY_SINGLE_PASS_STEREO
                half3 stereoCameraPos = half3((unity_StereoWorldSpaceCameraPos[0]+ unity_StereoWorldSpaceCameraPos[1])*.5);
                d.svdn = normalize(stereoCameraPos - d.worldSpacePosition);
                #else
                d.svdn = d.worldSpaceViewDir;
                #endif
            
                #if defined(EXTRA_V2F_0)
                d.extraV2F0 = i.extraV2F0;
                #endif
                #if defined(EXTRA_V2F_1)
                d.extraV2F1 = i.extraV2F1;
                #endif
                #if defined(EXTRA_V2F_2)
                d.extraV2F2 = i.extraV2F2;
                #endif
                #if defined(EXTRA_V2F_3)
                d.extraV2F3 = i.extraV2F3;
                #endif
                #if defined(NEED_SCREEN_POS)
                d.screenPos = i.screenPos;
                #endif
            
                // Additional Mesh Data Creator
                
                // Additional Mesh Data Creator End
            
                return d;
            }
            
            struct SurfaceData
            {
                half3 Albedo;
                half Alpha;
                half Hue;
                half Saturation;
                half Value;
                    
                half Metallic;
                half Smoothness;
                half Anisotropy;
                half3 Normal;
                    
                half Occlusion;
                int OcclusionMode;
            
                half3 Emission;
                int EmissionScaleWithLight;
                half EmissionLightThreshold;
                    
                half ShadowSharpness;
                    
                half4 RimLight;
                half RimAttenuation;
                half4 RimShadow;
                    
                half SpecularIntensity;
                half SpecularArea;
                half SpecularAlbedoTint;
                half SpecularAnisotropy;
                half SpecularSharpness;
                    
                half Reflectivity;
                half3 BakedReflection;
                half ReflectionBlendMode;
                    
                half3 OutlineColor;
                int OutlineLightingMode;
            
                // Additional Surface Data
                
                // Additional Surface Data End
            };
            
            SurfaceData CreateSurfaceData()
            {
                SurfaceData o = (SurfaceData) 0;
                o.Albedo = 0.5;
                o.Occlusion = 1;
                o.Normal = half3(0, 0, 1);
                o.Smoothness = 0.5;
                o.Alpha = 1;
                o.RimShadow = 1;
                o.RimAttenuation = 1;
                return o;
            }
            // GlobalVariables

            // Variables
            float4 _MainTex_ST;
            int _MainTexUVSet;
            int _TintByVertexColor;
            half4 _Color;
            half4 _BackfaceColor;
            half _BackfaceAlbedoTint;
            half _AlphaScale;
            half _Hue;
            half _Saturation;
            half _Value;
            half _ShadowSharpness;
            half2 GLOBAL_uv;
            int _OcclusionMode;
            half _OcclusionStrength;
            int _OcclusionTilingMode;
            half _OcclusionTiling;
            int _OcclusionDetailEnabled;
            half _OcclusionDetailStrength;
            int _OcclusionDetailTilingMode;
            half _OcclusionDetailTiling;
            #if defined(_AUDIOLINKVERTEX)
                uniform int _EnableAudioLinkVertex;
            #endif
            uniform fixed4 _AudioLinkVertexMap_ST;
            uniform half _AudioLinkVertexHistory;
            uniform int _AudioLinkVertexBand;
            uniform half _AudioLinkVertexIntensity;
            int _BumpMapTilingMode;
            float _BumpMapTiling;
            half _BumpScale;
            int _FlipBumpY;
            int _NormalBicubicSampling;
            half4 _DetailNormalMap_ST;
            int _DetailNormalsUVSet;
            half _DetailNormalTiling;
            half _DetailNormalScale;
            half _FlipDetailNormalY;
            int _DetailNormalMaskUVSet;
            half _DetailNormalMaskTiling;
            half3 GLOBAL_pixelNormal;
            int _StencilBasePass;
            int _StencilBaseComp;
            int _StencilOutlineComp;
            half4 _OutlineColor;
            int _OutlineLightingMode;
            half _OutlineAlbedoTint;
            half4 _OutlineMask_ST;
            half _OutlineWidth;
            int _OutlineWidthAdjustByVertexColor;
            int _SpecularMapUVSet;
            int _SpecularTilingMode;
            half _SpecularTiling;
            half _SpecularIntensity;
            half _SpecularRoughness;
            half _SpecularSharpness;
            half _SpecularAnisotropy;
            half _SpecularAlbedoTint;
            int _SpecularMaskTilingMode;
            half _SpecularMaskTiling;
            half _SpecularMaskStrength;
            int _ReflectionMode;
            half _ReflectionBlendMode;
            half _Smoothness;
            half _Metallic;
            int _RoughnessMode;
            int _MetallicGlossMapTilingMode;
            half _MetallicGlossMapTiling;
            half4 _MetallicRemap;
            half4 _SmoothnessRemap;
            half4 _MetallicGlossMap_TexelSize;
            half _ReflectionAnisotropy;
            half _MatcapBlur;
            half _MatcapTintToDiffuse;
            int _ReflectivityMaskTilingMode;
            half _ReflectivityMaskTiling;
            half _ReflectivityLevel;
            int _ALBand;
            half4 _ALEmissionColor;
            int _ALEmissionDotMask;
            int _ALEmissionDotMaskInvert;
            half _ALEmissionDotMaskSmoothing;
            int _ALGradientOnRed;
            int _ALGradientOnGreen;
            int _ALGradientOnBlue;
            half4 _ALPackedRedColor;
            half4 _ALPackedGreenColor;
            half4 _ALPackedBlueColor;
            int _ALSmoothingLevel;
            int _ALUVWidth;
            int _ALMapUVSet;
            half4 _EmissionColor;
            half _EmissionTintToDiffuse;
            int _EmissionScaleWithLight;
            half _EmissionScaleWithLightSensitivity;
            half4 _RimTint;
            half _RimIntensity;
            half _RimAlbedoTint;
            half _RimEnvironmentTint;
            half _RimAttenuation;
            half _RimRange;
            half _RimThreshold;
            half _RimSharpness;
            half4 _ShadowRimTint;
            half _ShadowRimRange;
            half _ShadowRimThreshold;
            half _ShadowRimSharpness;
            half _ShadowRimAlbedoTint;
            #if defined(_AUDIOLINKCHROMA)
                uniform int _EnableAudioLinkChroma;
            #endif
            uniform float4 _ChromaMask_ST;
            uniform fixed4 _ChromaTint;
            uniform int _ChromaForceIdle;
            uniform int _ChromaModeR;
            uniform int _ChromaModeG;
            uniform int _ChromaModeB;
            uniform fixed _ChromaHistory;
            uniform half _ChromaWarp;
            uniform half _ChromaSpeed;
            uniform half _ChromaBiased;
            uniform int _ChromaForceTheme;
            uniform fixed4 _ChromaTheme0;
            uniform fixed4 _ChromaTheme1;
            uniform fixed4 _ChromaTheme2;
            uniform fixed4 _ChromaTheme3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
                uniform int _ReactPriority;
            #endif
            #if !defined(_CHROMAMAP)
                uniform int _ChromaBand;
                uniform fixed _ChromaRotation;
            #endif
            #if defined(_LUMA)
                uniform int _EnableLuma;
            #endif
            #if defined(_LUMALEGACY)
                uniform fixed4 _Stored_TexelSize;
                const static int GRADSTART[3] = { LUMA_LEGACY_GRAD_START1, LUMA_LEGACY_GRAD_START2, LUMA_LEGACY_GRAD_START3 };
            #endif
            uniform float4 _LumaMask_ST;
            uniform fixed4 _LumaTint;
            uniform half _LumaWarp;
            uniform half _LumaBiased;
            uniform int _LumaGrad1;
            uniform int _LumaGrad2;
            uniform int _LumaGrad3;
            #ifndef REACTPRIORITY
                #define REACTPRIORITY
            #endif
            #if !defined(_LUMAMAP)
                uniform fixed _LumaRotation;
            #endif
            #if defined(_VIDEO)
                uniform int _EnableVideo;
            #endif
            #ifndef _UDON_VIDEOTEX_ST
                #define _UDON_VIDEOTEX_ST
                uniform float4 _Udon_VideoTex_ST;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
                uniform float4 _Udon_VideoTex_TexelSize;
            #endif
            uniform fixed4 _VideoTint;
            uniform float4 _VideoMask_ST;
            #if !defined(_VIDEOMAP)
                uniform fixed _VideoRatio;
                uniform fixed _VideoRotation;
            #endif
            #if defined(_CROWDWAVE)
                uniform int _EnableCrowdwave;
            #endif
            #ifndef _UDON_VIDEOTEX_TEXELSIZE
                #define _UDON_VIDEOTEX_TEXELSIZE
            #endif
            uniform fixed4 _CrowdwaveTint;
            uniform half _CrowdwaveBias;
            uniform float4 _CrowdwaveMask_ST;
            uniform float4x4 _Udon_CrowdwaveMeta;
            int _LTCGIEnableOnMobile;
            int _LTCGIClampBrightness;
            half _LTCGIMaxBrightness;
            half _LTCGIDiffuseIntensity;
            half _LTCGISpecularIntensity;
            half _LTCGIRoughnessModifier;
            int _LTCGIAlphaPremultiply;
            half _SheenStrength;
            half _SheenPower;
            half4 _SheenTint;
            half _SheenAlbedoTint;
            int _SheenBlendType;
            half4 _SheenMask_ST;
            int _VRCHideInVR;
            int _VRCHideInDesktop;
            int _VRCHideInVRCamera;
            int _VRCHideInDesktopCamera;
            int _VRCHideInVRMirror;
            int _VRCHideInDesktopMirror;
            float _VRChatCameraMode;
            float _VRChatMirrorMode;
            int _IgnoreLightprobeNormal;
            int _MinLight;
            half _MonochromeLighting;
            int _RenderType;
            half _Cutoff;

            // Textures
            TEXTURE2D(_MainTex);
            SAMPLER(sampler_MainTex);
            #if defined(SEPARATE_ALPHA)
            TEXTURE2D(_AlphaTex);
            #endif
            TEXTURE2D(_OcclusionMap);
            TEXTURE2D(_OcclusionDetail);
            TEXTURE2D(_AudioLinkVertexMap);
            SAMPLER(sampler_AudioLinkVertexMap);
            TEXTURE2D(_BumpMap);
            SAMPLER(sampler_BumpMap);
            TEXTURE2D(_DetailNormalMap);
            SAMPLER(sampler_DetailNormalMap);
            TEXTURE2D(_DetailNormalMask);
            SAMPLER(sampler_DetailNormalMask);
            TEXTURE2D(_OutlineTex);
            TEXTURE2D(_OutlineMask);
            SAMPLER(sampler_OutlineTex);
            SAMPLER(sampler_OutlineMask);
            TEXTURE2D(_SpecularMap);
            TEXTURE2D(_SpecularMask);
            TEXTURE2D(_Matcap);
            SAMPLER(sampler_Matcap);
            TEXTURE2D(_MetallicGlossMap);
            TEXTURE2D(_ReflectivityMask);
            TEXTURE2D(_ALMap);
            SAMPLER(sampler_ALMap);
            TEXTURE2D(_EmissionMap);
            TEXTURE2D(_ChromaMask);
            #if defined(_CHROMAMAP)
                TEXTURE2D(_ChromaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                    TEXTURE2D(_Stored);
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
                SAMPLER(bilinear_clamp);
            #endif
            TEXTURE2D(_LumaMask);
            #if defined(_LUMAMAP)
                TEXTURE2D(_LumaMap);
            #endif
            #ifndef STORED
                #define STORED
                #if defined(_LUMALEGACY)
                #endif
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef POINT_CLAMP
                #define POINT_CLAMP
                SAMPLER(point_clamp);
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
                TEXTURE2D(_Udon_VideoTex);
            #endif
            TEXTURE2D(_VideoMask);
            TEXTURE2D(_VideoFallback);
            #if defined(_VIDEOMAP)
                TEXTURE2D(_VideoMap);
            #endif
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            #ifndef _UDON_VIDEOTEX
                #define _UDON_VIDEOTEX
            #endif
            TEXTURE2D(_Udon_CrowdwaveMask);
            TEXTURE2D(_CrowdwaveMask);
            SAMPLER(sampler_Udon_CrowdwaveMask);
            SAMPLER(sampler_CrowdwaveMask);
            #ifndef BILINEAR_CLAMP
                #define BILINEAR_CLAMP
            #endif
            TEXTURE2D(_LTCGIRamp);
            SAMPLER(sampler_LTCGIRamp);
            TEXTURE2D(_SheenMask);
            SAMPLER(sampler_SheenMask);
            TEXTURE2D(_Ramp);
            SAMPLER(sampler_Ramp);
            TEXTURECUBE(_BakedCubemap);
            SAMPLER(sampler_BakedCubemap);

            // PassFunctions
            #if INCLUDE_LTCGI
            
            void LTCGICallbackDiffuse(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.diffuse += output.intensity * output.color;
            }
            
            void LTCGICallbackSpecular(inout LTCGIAccumulatorStruct acc, in ltcgi_output output)
            {
                acc.specular += output.intensity * output.color;
            }    
            
            #define LTCGI_V2_DIFFUSE_CALLBACK LTCGICallbackDiffuse
            #define LTCGI_V2_SPECULAR_CALLBACK LTCGICallbackSpecular
                
            #include "Packages/at.pimaker.ltcgi/Shaders/LTCGI.cginc"
            #endif

            // Functions
            void ToonMainFragment(MeshData d, inout SurfaceData o, bool facing)
            {
                half2 uv = 0;
                switch (_MainTexUVSet) {
                    case 0: uv = d.uv0; break;
                    case 1: uv = d.uv1; break;
                    case 2: uv = d.uv2; break;
                    case 3: uv = d.uv3; break;
                }
                uv = uv * _MainTex_ST.xy + _MainTex_ST.zw;
                GLOBAL_uv = uv;
                half4 albedo = SAMPLE_TEXTURE2D(_MainTex, sampler_MainTex, GLOBAL_uv);
                if (facing) {
                    albedo *= _Color;
                } else {
                    albedo = lerp(_BackfaceColor, albedo * _BackfaceColor, _BackfaceAlbedoTint);
                }
                half3 albedoHSV = RGB2HSV(albedo.rgb);
            
                albedoHSV.x = fmod(albedoHSV.x + _Hue, 1);
                albedoHSV.y = saturate(albedoHSV.y + _Saturation);
                albedoHSV.z = saturate(albedoHSV.z + _Value);
                albedo.rgb = HSV2RGB(albedoHSV);
            
                o.Hue = _Hue;
                o.Saturation = _Saturation;
                o.Value = _Value;
                    
                if (_TintByVertexColor) {
                    albedo.rgb *= d.vertexColor.rgb;
                }
                o.Albedo = albedo.rgb;
                #if defined(NEED_ALBEDO_ALPHA)
                {
                    #if defined(SEPARATE_ALPHA) 
                    o.Alpha = saturate(SAMPLE_TEXTURE2D(_AlphaTex, sampler_MainTex, GLOBAL_uv).r * _AlphaScale);
                    #else
                    o.Alpha = saturate(albedo.a * _AlphaScale);
                    #endif
                }
                #else
                o.Alpha = 1;
                #endif
                o.ShadowSharpness = _ShadowSharpness;
            }
            

            void ToonOcclusionFragment(MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half occlusion = SAMPLE_TEXTURE2D(_OcclusionMap, sampler_MainTex, lerp(globalUv * _OcclusionTiling, d.uv0 * _OcclusionTiling, _OcclusionTilingMode)).r;
                o.Occlusion = lerp(1, occlusion, _OcclusionStrength);
                    
                if (_OcclusionDetailEnabled) {
                    half occlusionDetail = SAMPLE_TEXTURE2D(_OcclusionDetail, sampler_MainTex, lerp(globalUv * _OcclusionDetailTiling, d.uv0 * _OcclusionDetailTiling, _OcclusionDetailTilingMode)).r;
                    o.Occlusion *= lerp(1, occlusionDetail, _OcclusionDetailStrength);
                }
            
                o.OcclusionMode = _OcclusionMode;
            }
            

            
                float4 QuanternionMultiply(float4 a, float4 b)
                {
            
                    return float4(a.w * b.xyz + b.w * a.xyz + cross(a.xyz, b.xyz), a.w * b.w - dot(a.xyz, b.xyz));
                }
            
                float3 QuanternionRotate(float3 pos, float3 vec, float rotate)
                {
            
                    rotate /= 2.0;
            
                    float4 quat1 = float4(vec.xyz, cos(rotate));
                    quat1.xyz *= sin(rotate);
            
                    float4 quat2 = float4(-quat1.x, -quat1.y, -quat1.z, quat1.w);
            
                    float4 mulpos = (quat1 * float4(pos, 0.0)) * quat2;
                    mulpos = QuanternionMultiply(QuanternionMultiply(quat1, float4(pos, 0.0)), quat2);
            
                    return mulpos;
            
                }
            
                void AudioLinkVertex(inout VertexData v)
                {
                    #if defined(_AUDIOLINKVERTEX)
            
                        if (!_EnableAudioLinkVertex) return;
            
                        half2 map = _AudioLinkVertexMap.SampleLevel(sampler_AudioLinkVertexMap, TRANSFORM_TEX(v.uv0.xy, _AudioLinkVertexMap), 0).rg;
                        half value = AudioLinkIsAvailable() ? AudioLinkLerp(float2(map.g * _AudioLinkVertexHistory, _AudioLinkVertexBand)).r * _AudioLinkVertexIntensity : 0.0;
            
                        v.vertex.xyz += v.normal.xyz * value * map.r;
            
                    #endif
                }
            

            void ToonNormalsFragment(inout MeshData d, inout SurfaceData o) {
                half2 globalUv = 0;
            
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                #if defined(NORMALS_SET)
                float4 normalTex = 0;
                if (_NormalBicubicSampling) {
                    normalTex = tex2DFastBicubicSampleNoChecks(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                } else {
                    normalTex = SAMPLE_TEXTURE2D(_BumpMap, sampler_BumpMap, lerp(globalUv, d.uv0.xy, _BumpMapTilingMode) * _BumpMapTiling);
                }
                if (_FlipBumpY)
                {
                    normalTex.y = 1 - normalTex.y;
                }
                half3 normal = UnpackNormalScale(normalTex, _BumpScale);
            
                o.Normal = BlendNormals(o.Normal, normal);
                #endif
                    
                #if defined(DETAIL_NORMALS_SET)
                    
                half2 detailUV = 0;
                switch (_DetailNormalsUVSet) {
                    case 0: detailUV = d.uv0; break;
                    case 1: detailUV = d.uv1; break;
                    case 2: detailUV = d.uv2; break;
                    case 3: detailUV = d.uv3; break;
                }
                detailUV = detailUV * _DetailNormalTiling;
                half4 detailNormalTex = SAMPLE_TEXTURE2D(_DetailNormalMap, sampler_DetailNormalMap, detailUV);
                if (_FlipDetailNormalY)
                {
                    detailNormalTex.y = 1 - detailNormalTex.y;
                }
            
                half2 detailMaskUV = 0;
                switch (_DetailNormalMaskUVSet) {
                    case 0: detailMaskUV = d.uv0; break;
                    case 1: detailMaskUV = d.uv1; break;
                    case 2: detailMaskUV = d.uv2; break;
                    case 3: detailMaskUV = d.uv3; break;
                }
                detailMaskUV *= _DetailNormalMaskTiling;
                half detailMask = SAMPLE_TEXTURE2D(_DetailNormalMask, sampler_DetailNormalMask, detailMaskUV).r;
            
                half3 detailNormal = UnpackNormalScale(detailNormalTex, _DetailNormalScale);
                    
                o.Normal = lerp(o.Normal, BlendNormals(o.Normal, detailNormal), detailMask);
            
                #endif
            
                #if defined(NORMALS_SET) || defined(DETAIL_NORMALS_SET)
            
                half3 properNormal = normalize(mul(o.Normal, d.TBNMatrix));
                d.worldSpaceTangent.xyz = cross(d.bitangent.xyz, properNormal);
                d.bitangent.xyz = cross(properNormal, d.worldSpaceTangent.xyz);
                d.TBNMatrix = float3x3(normalize(d.worldSpaceTangent.xyz), d.bitangent, d.worldNormal);
                GLOBAL_pixelNormal = properNormal;
            
                #else
            
                GLOBAL_pixelNormal = normalize(mul(o.Normal, d.TBNMatrix));
            
                #endif
            }
            

            void ToonOutlineVertex(inout VertexData v) {
                #if defined(PASS_OUTLINE)
                half mask = SAMPLE_TEXTURE2D_LOD(_OutlineMask, sampler_OutlineMask, TRANSFORM_TEX(v.uv0, _OutlineMask), 0);
                half3 width = mask * _OutlineWidth * .01;
                width *= min(distance(TransformObjectToWorld(v.vertex.xyz), _WorldSpaceCameraPos) * 3, 1);
                v.vertex.xyz += v.normal.xyz * lerp(width, width * v.color.r, _OutlineWidthAdjustByVertexColor);
                    
                #endif
            }
            

            void ToonOutlineFragment(MeshData d, inout SurfaceData o) {
                half3 outline = SAMPLE_TEXTURE2D(_OutlineTex, sampler_OutlineTex, d.uv0).rgb;
                o.OutlineColor = lerp(_OutlineColor * outline, _OutlineColor * outline * o.Albedo, _OutlineAlbedoTint);
                o.OutlineLightingMode = _OutlineLightingMode;
            }
            

            void ToonSpecularFragment(MeshData d, inout SurfaceData o) {
                #if defined(SPECULAR_ON)
                    
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half2 specularUv = lerp(globalUv * _SpecularTiling, d.uv0 * _SpecularTiling, _SpecularTilingMode);
                half2 specularMaskUv = lerp(globalUv * _SpecularMaskTiling, d.uv0 * _SpecularMaskTiling, _SpecularMaskTilingMode);
            
                half3 specMap = SAMPLE_TEXTURE2D(_SpecularMap, sampler_MainTex, specularUv);
                o.SpecularIntensity = max(0, _SpecularIntensity * specMap.r);
                o.SpecularArea = max(0.01, GSAA_Filament(d.worldNormal, _SpecularRoughness, 0.05, 0.1) * specMap.b);
                o.SpecularAnisotropy = _SpecularAnisotropy;
                o.SpecularAlbedoTint = _SpecularAlbedoTint * specMap.g;
                o.SpecularSharpness = _SpecularSharpness;
                o.SpecularArea = lerp(o.SpecularArea, o.SpecularArea * SAMPLE_TEXTURE2D(_SpecularMask, sampler_MainTex, specularMaskUv).r, _SpecularMaskStrength);
                #endif
            }
            

            void ToonReflectionFragment(MeshData d, inout SurfaceData o) {
                #if defined(REFLECTION_MODE_OFF)
                return;
                #endif
            
                o.ReflectionBlendMode = _ReflectionBlendMode;
            
                half2 globalUv = 0;
                    
                #if defined(GLOBAL_UV_SET)
                globalUv = GLOBAL_uv;
                #else
                globalUv = d.uv0;
                #endif
            
                half mask = SAMPLE_TEXTURE2D(_ReflectivityMask, sampler_MainTex, lerp(globalUv * _ReflectivityMaskTiling, d.uv0 * _ReflectivityMaskTiling, _ReflectivityMaskTilingMode)).r;
                mask *= _ReflectivityLevel;
                    
                #if defined(REFLECTION_MODE_PBR) || defined(REFLECTION_MODE_BAKED_CUBEMAP)
                        
                half4 metalSmooth = SAMPLE_TEXTURE2D(_MetallicGlossMap, sampler_MainTex, lerp(globalUv * _MetallicGlossMapTiling, d.uv0 * _MetallicGlossMapTiling, _MetallicGlossMapTilingMode));
                int hasMetallicSmooth = _MetallicGlossMap_TexelSize.z > 8;
                half metal = metalSmooth.r;
                half smooth = metalSmooth.a;
                if (_RoughnessMode)
                {
                    smooth = 1 - smooth;
                }
                metal = remap(metal, 0, 1, _MetallicRemap.x, _MetallicRemap.y);
                smooth = remap(smooth, 0, 1, _SmoothnessRemap.x, _SmoothnessRemap.y);
                o.Metallic = lerp(_Metallic, metal, hasMetallicSmooth);
                o.Smoothness = lerp(_Smoothness, smooth, hasMetallicSmooth);
                o.Anisotropy = _ReflectionAnisotropy;
                    
                #elif defined(REFLECTION_MODE_MATCAP)
                    
                half3 upVector = half3(0,1,0);
                half2 remapUV = calcMatcapUV(upVector, d.worldSpaceViewDir, GLOBAL_pixelNormal);
                half4 spec = 0; 
                spec = SAMPLE_TEXTURE2D_LOD(_Matcap, sampler_Matcap, remapUV, _MatcapBlur * UNITY_SPECCUBE_LOD_STEPS);
            
                spec.rgb *= lerp(1, o.Albedo, _MatcapTintToDiffuse);
                o.BakedReflection = spec.rgb;
                    
                #endif
            
                o.Reflectivity = mask;
            }
            

            void ToonALFragment(MeshData d, inout SurfaceData o) {
                #if defined(AL_MODE_NONE)
                    return;
                #else
            
                if(AudioLinkIsAvailable()) {
                    half2 alUV = 0;
            
                    half2 globalUv = 0;
            
                    #if defined(GLOBAL_UV_SET)
                    globalUv = GLOBAL_uv;
                    #else
                    globalUv = d.uv0;
                    #endif
            
                    switch (_ALMapUVSet) {
                        case 0: alUV = globalUv; break;
                        case 1: alUV = d.uv1; break;
                        case 2: alUV = d.uv2; break;
                        case 3: alUV = d.uv3; break;
                    }
                    half4 alMask = SAMPLE_TEXTURE2D(_ALMap, sampler_ALMap, alUV);
            
                    #if defined(AL_MODE_SINGLE_CHANNEL)
            
                    half sampledAL = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        sampledAL = AudioLinkData(int2(0, _ALBand)).x;
                    } else {
                        sampledAL = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel, _ALBand)).x;
                    }
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
            
                    #elif defined(AL_MODE_PACKED_MAP)
            
                    half audioDataBass = 0;
                    half audioDataMids = 0;
                    half audioDataHighs = 0;
                    UNITY_BRANCH
                    if (_ALSmoothingLevel == 0) {
                        audioDataBass = AudioLinkData(ALPASS_AUDIOBASS).x;
                        audioDataMids = AudioLinkData(ALPASS_AUDIOLOWMIDS).x;
                        audioDataHighs = (AudioLinkData(ALPASS_AUDIOHIGHMIDS).x + AudioLinkData(ALPASS_AUDIOTREBLE).x) * 0.5;
                    } else {
                        audioDataBass = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,0)).x;
                        audioDataMids = AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,1)).x;
                        audioDataHighs = (AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,2)).x + AudioLinkData(ALPASS_FILTEREDAUDIOLINK + int2(16 - _ALSmoothingLevel,3)).x) * 0.5;
                    }
            
                    audioDataMids = clamp(audioDataMids, 0, 0.98);
            
                    half tLow = smoothstep((1-audioDataBass), (1-audioDataBass) + 0.01, alMask.r) * alMask.a;
                    half tMid = smoothstep((1-audioDataMids), (1-audioDataMids) + 0.01, alMask.g) * alMask.a;
                    half tHigh = smoothstep((1-audioDataHighs), (1-audioDataHighs) + 0.01, alMask.b) * alMask.a;
            
                    half4 emissionChannelRed = lerp(alMask.r, tLow, _ALGradientOnRed) * _ALPackedRedColor * audioDataBass;
                    half4 emissionChannelGreen = lerp(alMask.g, tMid, _ALGradientOnGreen) * _ALPackedGreenColor * audioDataMids;
                    half4 emissionChannelBlue = lerp(alMask.b, tHigh, _ALGradientOnBlue) * _ALPackedBlueColor * audioDataHighs;
                    half3 em = emissionChannelRed.rgb + emissionChannelGreen.rgb + emissionChannelBlue.rgb;
                    
                    #elif defined(AL_MODE_UV_BASED)
            
                    half2 aluv;
                    aluv = half2(alUV.x * _ALUVWidth, alUV.y);
                    half sampledAL = AudioLinkLerp(aluv).x;
                    half3 em = alMask.rgb * _ALEmissionColor.rgb * sampledAL;
                        
                    #else
                    half3 em = 0;
                    #endif
            
                    half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                    NoV = lerp(NoV, 1 - NoV, _ALEmissionDotMaskInvert);
                    NoV = saturate(pow(NoV, _ALEmissionDotMaskSmoothing));
                    o.Emission += lerp(em, em * NoV, _ALEmissionDotMask);
                }
            
                #endif
            }
            

            void ToonEmissionFragment(inout SurfaceData o) {
                #if defined(_EMISSION)
                half3 emission = SAMPLE_TEXTURE2D(_EmissionMap, sampler_MainTex, GLOBAL_uv).rgb;
                emission *= lerp(emission, emission * o.Albedo, _EmissionTintToDiffuse) * _EmissionColor;
                o.Emission += emission;
                #endif
                o.EmissionScaleWithLight = _EmissionScaleWithLight;
                o.EmissionLightThreshold = _EmissionScaleWithLightSensitivity;
            }
            

            void ToonRimLightFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMLIGHT_ON)
                    
                #ifndef USING_DIRECTIONAL_LIGHT
                    fixed3 lightDir = normalize(UnityWorldSpaceLightDir(d.worldSpacePosition));
                #else
                    fixed3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
            
                half3 normal = 0;
                #if defined(PIXEL_NORMAL_SET)
                normal = GLOBAL_pixelNormal;
                #else
                normal = o.Normal;
                #endif
            
                half lightNoL = saturate(dot(normal, lightDir));
                half SVDNoN = abs(dot(d.svdn, normal));
            
                half rimIntensity = saturate((1 - SVDNoN)) * saturate(pow(lightNoL, _RimThreshold));
                rimIntensity = smoothstep(_RimRange - _RimSharpness, _RimRange + _RimSharpness, rimIntensity);
                half4 rim = rimIntensity * _RimIntensity;
            
                // Rim Light Env Tint
                half3 env = 0;
                #if defined(UNITY_PASS_FORWARDBASE)
                    env = getEnvReflection(d.worldSpaceViewDir.xyz, d.worldSpacePosition.xyz, normal, o.Smoothness, 5);
                #endif
                    
                o.RimLight = rim * _RimTint * lerp(1, half4(o.Albedo.rgb,1), _RimAlbedoTint) * lerp(1, half4(env.rgb,1), _RimEnvironmentTint);
                o.RimLight *= _RimTint.a;
                o.RimAttenuation = _RimAttenuation;
                    
                #endif
            }
            

            void ToonShadowRimFragment(MeshData d, inout SurfaceData o) {
                #if defined(RIMSHADOW_ON)
            
                Light mainLight = GetMainLight(0..xxxx, d.worldSpacePosition, 0..xxxx);
            
                float3 lightDir = mainLight.direction;
                    
                bool lightEnv = any(lightDir.xyz);
                if (!lightEnv) {
                    lightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                }
                half lightNoL = saturate(dot(GLOBAL_pixelNormal, lightDir));
                half SVDNoN = abs(dot(d.svdn, GLOBAL_pixelNormal));
                half shadowRimIntensity = saturate((1 - SVDNoN)) * pow(1 - lightNoL, _ShadowRimThreshold * 2);
                shadowRimIntensity = smoothstep(_ShadowRimRange - _ShadowRimSharpness, _ShadowRimRange + _ShadowRimSharpness, shadowRimIntensity);
            
                o.RimShadow = lerp(1, (_ShadowRimTint * lerp(1, o.Albedo.rgbb, _ShadowRimAlbedoTint)), shadowRimIntensity);
            
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
                #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            bool ShouldReact() { return AudioLinkIsAvailable() && !_ChromaForceIdle; }
            
            float ChronoTime(int band)
            {
                if (ShouldReact()) return AudioLinkGetChronoTime(0, band);
                return _Time.x;
            }
            
            fixed3 ThemeColor(int theme)
            {
                theme %= 4;
                if (ShouldReact() && !_ChromaForceTheme)
                {
                    return AudioLinkData(ALPASS_THEME_COLOR0 + int2(theme, 0));
                } else switch (theme) {
                    case 0:
                        return _ChromaTheme0;
            
                    case 1:
                        return _ChromaTheme1;
            
                    case 2:
                        return _ChromaTheme2;
            
                    case 3:
                        return _ChromaTheme3;
            
                    default:
                        return 0.0;
                }
            }
            
            // float3 ThemeHue(float value)
            // {
            //     float scaledTime = value * 4.0;
            //     return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime));
            // }
            
            fixed3 ChromaEffect(int effect, int band, float progress, float value)
            {
                fixed dft = 0.0;
                if (effect > 8)
                    if (ShouldReact())
                    {
                        dft = AudioLinkLerpMultiline(ALPASS_DFT + float2(progress * AUDIOLINK_ETOTALBINS, 0.0)).g * 0.9;
                    } else
                        dft = (_Time.x * _ChromaSpeed) - progress;
            
                switch (effect)
                {
                    case 1: // Color Theme 1 to Color Theme 2
                        return lerp(ThemeColor(0), ThemeColor(1), progress) * value;
            
                    case 2: // Color Theme 3 to Color Theme 4
                        return lerp(ThemeColor(2), ThemeColor(3), progress) * value;
            
                    case 3: // Color Themes 1 - 4
                        float scaledTime = progress * 3.0;
                        return lerp(ThemeColor(scaledTime), ThemeColor(scaledTime + 1), frac(scaledTime)) * value;
            
                    case 4: // Solid Hue Chronotensity
                        return HSV2RGB(float3(ChronoTime(band) * _ChromaSpeed, 1.0, value));
            
                    case 5: // Hue Value
                        return HSV2RGB(float3(ShouldReact() ? value : (_Time.x + .5 * _ChromaSpeed), 1.0, value));
            
                    case 6: // Hue Time Gradient
                        return HSV2RGB(float3((_Time.x * 2.0 * _ChromaSpeed) - progress, 1.0, value));
            
                    case 7: // Hue Time Gradient + Time Pulse Gradient
                        return HSV2RGB(float3(((_Time.y / 5.0) * _ChromaSpeed) - progress, 1.0, value * abs(sin((_Time.y * _ChromaSpeed) - (progress * 15.0)))));
            
                    case 8: // Hue Chronotensity Gradient
                        return HSV2RGB(float3((((ChronoTime(band) * _ChromaSpeed) + AudioLinkGetChronoTime(4, band)) * 0.33) - progress, 1.0, value));
            
                    case 9: // Waveform Hue
                        return HSV2RGB(float3(dft, 1.0, value));
            
                    case 10: // Warped Waveform Hue
                        return HSV2RGB(float3((sin((dft - progress) * UNITY_PI) + 1.0) / 2.0, 1.0, value));
            
                    default:
                        return 0.0;
                }
            }
            
            void ChromaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_AUDIOLINKCHROMA)
            
                    if (!_EnableAudioLinkChroma) return;
            
                    #if defined(_LUMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (!_ReactPriority) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _ChromaMask);
            
                    fixed4 mask = _ChromaMask.Sample(bilinear_clamp, uv);
                    #if defined(_CHROMAMAP)
                        fixed4 map = _ChromaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
            
                        int band = floor(clamp(mask.a * 4.0, 0.0, 3.99));
                    #else
                        uv = rotate(uv - 0.5, _ChromaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, clamp(uv.x, 0.0, 1.0));
            
                        int band = _ChromaBand;
                    #endif
                    map.a = pow(map.a, _ChromaWarp);
            
                    fixed value = 1.0;
                    if (ShouldReact()) value = AudioLinkLerp(float2(map.a * _ChromaHistory, band)).r;
            
                    fixed3 color = 0.0;
                    color += ChromaEffect(_ChromaModeR, band, map.a, value) * map.r;
                    #if defined(_CHROMAMAP)
                        color += ChromaEffect(_ChromaModeG, band, map.a, value) * map.g;
                        color += ChromaEffect(_ChromaModeB, band, map.a, value) * map.b;
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.114)), _ChromaBiased) * _ChromaTint * mask.rgb;
            
                    o.Emission += color;
                #endif
            }
            

            #ifndef LUMACHECKS
                #define LUMACHECKS
                bool IsLumaLegacyAvailable()
                {
                    #if defined(_LUMALEGACY)
                        return _Stored_TexelSize.z > 16 && all(_Stored.SampleLevel(point_clamp, LUMA_LEGACY_POWER_POSITION / LUMA_LEGACY_SIZE, 0).rgb == fixed3(1.0, 0.0, 0.0));
                    #else
                        return false;
                    #endif
                }
            
                bool IsLumaAvailable()
                {
                    if (AudioLinkIsAvailable()) return AudioLinkData(int2(0, LUMA_START - LUMA_POWER)).r > 0.5;
                    return false;
                }
            #endif
            
            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            fixed3 LumaGradient(int grad, fixed prog)
            {
                return AudioLinkLerp(float2(prog * 127.0, LUMA_START - (grad % LUMA_POWER)));
            }
            
            fixed3 LumaLegacyGradient(int grad, fixed prog)
            {
                #if defined(_LUMALEGACY)
                    if (grad < 4)
                    {
                        fixed2 theme = fixed2((grad / 2) * LUMA_LEGACY_THEME_SIZE, -(grad % 2) * LUMA_LEGACY_THEME_SIZE);
                        return _Stored.SampleLevel(bilinear_clamp, (LUMA_LEGACY_THEME_POSITION + theme) / LUMA_LEGACY_SIZE, 0);
                    } else {
                        prog = GRADSTART[grad - 4] + (LUMA_LEGACY_LENGTH * prog);
                        return _Stored.SampleLevel(bilinear_clamp, fixed2(prog, LUMA_LEGACY_Y) / LUMA_LEGACY_SIZE, 0);
                    }
                #endif
            
                return 0.0;
            }
            
            void LumaFrag(MeshData d, inout SurfaceData o)
            {
                #if defined(_LUMA)
            
                    if (!_EnableLuma) return;
            
                    #if defined(_AUDIOLINKCHROMA)
                        #if defined(_LUMALEGACY)
                            if (IsLumaAvailable() || IsLumaLegacyAvailable())
                        #else
                            if (IsLumaAvailable())
                        #endif
                                if (_ReactPriority) return;
                    #endif
            
                    #if defined(_LUMALEGACY)
                        if (!IsLumaAvailable() && !IsLumaLegacyAvailable()) return;
                    #else
                        if (!IsLumaAvailable()) return;
                    #endif
            
                    float2 uv = TRANSFORM_TEX(d.uv0, _LumaMask);
            
                    fixed4 mask = _LumaMask.Sample(bilinear_clamp, uv);
                    #if defined(_LUMAMAP)
                        fixed4 map = _LumaMap.SampleLevel(bilinear_clamp, uv, 0);
                        map.a = 1.0 - map.a;
                    #else
                        uv = rotate(uv - 0.5, _LumaRotation) + 0.5;
                        fixed4 map = fixed4(1.0, 0.0, 0.0, uv.x);
                    #endif
            
                    map.a = pow(map.a, _LumaWarp);
                    fixed3 color = 0.0;
            
                    #if defined(_LUMALEGACY)
                        if (IsLumaAvailable())
                        {
                            color += LumaGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        } else {
                            map.a = 1.0 - map.a;
                            color += LumaLegacyGradient(_LumaGrad1, map.a) * map.r;
                            #if defined(_LUMAMAP)
                                color += LumaLegacyGradient(_LumaGrad2, map.a) * map.g;
                                color += LumaLegacyGradient(_LumaGrad3, map.a) * map.b;
                            #endif
                        }
                    #else
                        color += LumaGradient(_LumaGrad1, map.a) * map.r;
                        #if defined(_LUMAMAP)
                            color += LumaGradient(_LumaGrad2, map.a) * map.g;
                            color += LumaGradient(_LumaGrad3, map.a) * map.b;
                        #endif
                    #endif
            
                    color = lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _LumaBiased) * _LumaTint * mask.rgb;
            
                    o.Emission += color;
            
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            void VideoFrag(MeshData d, inout SurfaceData o) {
            
                #if defined(_VIDEO)
                    if (!_EnableVideo) return;
            
                    float2 videouv = TRANSFORM_TEX(d.uv0, _VideoMask);
                    fixed4 video = 0.0;
            
                    #if defined(_VIDEOMAP)
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                        videouv = _VideoMap.SampleLevel(bilinear_clamp, videouv, 0).rg;
                    #else
                        videouv -= 0.5;
                        videouv = rotate(videouv, _VideoRotation);
                        videouv.y *= _VideoRatio;
                        videouv += 0.5;
                        half3 mask = _VideoMask.Sample(bilinear_clamp, videouv);
                    #endif
            
            
            
                    if (videouv.x > 0.0 && videouv.x < 1.0 && videouv.y > 0.0 && videouv.y < 1.0 && any(mask > 0.01))
                    {
                        if (IsVideoAvailable())
                        {
                            #if defined(_VIDEOAST)
                                videouv = TRANSFORM_TEX(videouv, _Udon_VideoTex);
                            #endif
                            video.rgb = _Udon_VideoTex.SampleLevel(bilinear_clamp, videouv, 0);
                        } else video.rgb = _VideoFallback.SampleLevel(bilinear_clamp, videouv, 0);
            
                        fixed3 videocolor = video.rgb * mask.rgb * _VideoTint.rgb;
                        #if defined(_VIDEOALBEDO)
                            o.Albedo.rgb = lerp(o.Albedo.rgb, videocolor, _VideoTint.a);
                        #else
                            o.Emission += videocolor;
                        #endif
                    }
                #endif
            }
            

            #if !defined(ROTATE)
            #define ROTATE
                float2 rotate(float2 uv, float deg) {
                    deg *= 0.0174533;
                    float2 rotsinc = float2(sin(deg), cos(deg));
                    return mul(uv, float2x2(rotsinc.y, -rotsinc.x, rotsinc.x, rotsinc.y));
                }
            #endif
            
            #ifndef ISVIDEOAVAILABLE
                #define ISVIDEOAVAILABLE
                bool IsVideoAvailable()
                {
                    return _Udon_VideoTex_TexelSize.z > 16;
                }
            #endif
            
            fixed4 SampleCrowdwave(float3 objectPos)
            {
            
                float2 position = mul(unity_ObjectToWorld, float4(objectPos, 1.0)).xz;
            
                float2 worldPosition = _Udon_CrowdwaveMeta._m20_m21_m22_m23.xz;
                float4 screenBounds = _Udon_CrowdwaveMeta._m00_m01_m02_m03;
                float2 worldBounds = _Udon_CrowdwaveMeta._m10_m11_m12_m13.xy;
                fixed worldRotation = _Udon_CrowdwaveMeta._m20_m21_m22_m23.w;
                half intensity = _Udon_CrowdwaveMeta._m10_m11_m12_m13.z;
                //_Udon_CrowdwaveMeta._m10_m11_m12_m13.w;
                //_Udon_CrowdwaveMeta._m30_m31_m32_m33;
            
                intensity = intensity > 1.0 ? intensity - 1.0 : 0.0;
            
                position -= worldPosition;
                position.xy = rotate(position.xy, worldRotation);
                position.xy += worldBounds / 2.0;
                position.xy /= worldBounds;
            
                half mask = _Udon_CrowdwaveMask.SampleLevel(sampler_Udon_CrowdwaveMask, position.xy, 0);
                if (!IsVideoAvailable() || position.x < 0.0 || position.x > 1.0 || position.y < 0.0 || position.y > 1.0) mask = 0.0;
            
                position.xy *= screenBounds.xy;
                position.xy += screenBounds.zw;
            
                fixed3 color = _Udon_VideoTex.SampleLevel(bilinear_clamp, position.xy, 0) * intensity * mask;
            
                return fixed4(color.xyz, mask);
            
            }
                
            void CrowdwaveFrag(MeshData d, inout SurfaceData o)
            {
            
                #if defined(_CROWDWAVE)
                    if (!_EnableCrowdwave) return;
            
                    half3 crowdwaveMask = _CrowdwaveMask.Sample(sampler_CrowdwaveMask, TRANSFORM_TEX(d.uv0, _CrowdwaveMask));
            
                    #if defined(_CROWDWAVERANGE)
                        fixed3 color = SampleCrowdwave(d.localSpacePosition).rgb;
                    #else
                        fixed3 color = SampleCrowdwave(0.0).rgb;
                    #endif
            
                    o.Emission += lerp(color, dot(color, fixed3(0.299, 0.587, 0.144)), _CrowdwaveBias) * _CrowdwaveTint * crowdwaveMask;
                #endif
            }
            

            void LTCGICustomGI(MeshData d, SurfaceData o, inout half3 indirectSpecular, inout half3 indirectDiffuse)
            {
                #if !defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            o.Normal.xyz,
                            d.worldSpaceViewDir,
                            saturate((1 - o.Smoothness) + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            indirectSpecular += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            indirectSpecular += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        indirectDiffuse += ltcgiData.diffuse * _LTCGIDiffuseIntensity;
                    #endif
                }
                #endif
            }
            

            void LTCGIColor(MeshData d, FragmentData i, inout SurfaceData o, inout half4 FinalColor, bool facing)
            {
                #if defined(ORL_LIGHTING_MODEL_TOON)
                {
                    #if defined(PLAT_QUEST)
                    if (!_LTCGIEnableOnMobile) return;
                    #endif
            
                    #if defined(INTEGRATE_LTCGI)
                        #if defined(PASS_OUTLINE)
                        return;
                        #endif
            
                        LTCGIAccumulatorStruct ltcgiData = (LTCGIAccumulatorStruct) 0;
            
                        float3 viewDir = d.worldSpaceViewDir;
                        if (!facing)
                        {
                            viewDir = -d.worldSpaceViewDir;
                        }
            
                        LTCGI_Contribution(
                            ltcgiData,
                            d.worldSpacePosition.xyz,
                            d.worldNormal.xyz,
                            viewDir,
                            saturate(0.5 + _LTCGIRoughnessModifier),
                            d.uv1.xy
                        );
            
                        if (_LTCGIClampBrightness) {
                            half3 hsv = RGB2HSV(ltcgiData.specular);
                            hsv.z = tanh(hsv.z) * max(0, _LTCGIMaxBrightness);
                            FinalColor.rgb += HSV2RGB(hsv) * _LTCGISpecularIntensity;
                        } else {
                            FinalColor.rgb += ltcgiData.specular * _LTCGISpecularIntensity;
                        }
                        half3 rampHSV = RGB2HSV(ltcgiData.diffuse);
                        rampHSV.z = tanh(rampHSV.z);
                        rampHSV.z = SAMPLE_TEXTURE2D(_LTCGIRamp, sampler_LTCGIRamp, half2(rampHSV.z, 0)).r;
                        FinalColor.rgb += HSV2RGB(rampHSV) * o.Albedo * _LTCGIDiffuseIntensity;
                        if (_LTCGIAlphaPremultiply)
                        {
                            FinalColor.rgb *= FinalColor.a;
                        }
                    #endif
                }
                #endif
            }
            

            void Toon_SheenFragment(MeshData d, inout SurfaceData o) {
                half sheenMask = _SheenMask.SampleLevel(sampler_SheenMask, TRANSFORM_TEX(d.uv0, _SheenMask), 0).r;
                if (sheenMask < 0.5) return;
            
                half NoV = saturate(dot(d.worldNormal, d.worldSpaceViewDir));
                NoV = saturate(pow(NoV, _SheenPower));
                half3 blendSource = lerp(_SheenTint, o.Albedo, _SheenAlbedoTint);
                half3 blended = blendSource;
                switch (_SheenBlendType)
                {
                    case 0: blended = BlendOverlay(o.Albedo, blendSource * NoV); break;
                    case 1: blended = BlendLighten(o.Albedo, blendSource * NoV); break;
                    case 2: blended = BlendScreen(o.Albedo, blendSource * NoV); break;
                    case 3: blended = o.Albedo * blendSource * NoV; break;
                }
                o.Albedo = lerp(o.Albedo, blended, _SheenStrength);
            
            }
            

            void VRCFeaturesVertex(inout VertexData v)
            {
                #if defined(VRC_FEATURES)
                bool isInVRHandCam = _VRChatCameraMode == 1;
                bool isInDesktopHandCam = _VRChatCameraMode == 2;
                bool isInVR = isVR();
                bool isInDesktop = !isInVR && !isInDesktopHandCam;
                bool isInVRMirror = _VRChatMirrorMode == 1;
                bool isInDesktopMirror = _VRChatMirrorMode == 2;
            
                if (_VRCHideInVR && isInVR)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktop && isInDesktop)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRCamera && isInVRHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopCamera && isInDesktopHandCam)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInVRMirror && isInVRMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                if (_VRCHideInDesktopMirror && isInDesktopMirror)
                {
                    v.vertex = asfloat(-1);
                    return;
                }
                #endif
            }
            

            half4 calcRamp(half NdL, half attenuation, half occlusion, int occlusionMode)
            {
                half remapRamp;
                remapRamp = NdL * 0.5 + 0.5;
                remapRamp *= lerp(1, occlusion, occlusionMode);
                #if defined(UNITY_PASS_FORWARDBASE)
                remapRamp *= attenuation;
                #endif
                half4 ramp = SAMPLE_TEXTURE2D(_Ramp, sampler_Ramp, half2(remapRamp, 0));
                return ramp;
            }
            
            half3 calcIndirectSpecular(half lightAttenuation, MeshData d, SurfaceData o, half roughness, half3 reflDir, half3 indirectLight, float3 fresnel, half4 ramp)
            {
                half3 spec = half3(0,0,0);
            
                #if defined(REFLECTION_MODE_OFF)
                return spec;
                #endif
            
                #if defined(REFLECTION_MODE_MATCAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    spec = o.BakedReflection;
                    if(o.ReflectionBlendMode != 1)
                    {
                        spec *= (indirectLight + (_LightColor0 * lightAttenuation) * 0.5);
                    }
                }
                #endif
            
                #if defined(REFLECTION_MODE_PBR) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 reflectionUV1 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube0_ProbePosition, unity_SpecCube0_BoxMin, unity_SpecCube0_BoxMax);
                    half4 probe0 = UNITY_SAMPLE_TEXCUBE_LOD(unity_SpecCube0, reflectionUV1, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    half3 probe0sample = DecodeHDR(probe0, unity_SpecCube0_HDR);
            
                    half3 indirectSpecular;
                    half interpolator = unity_SpecCube0_BoxMin.w;
            
                    UNITY_BRANCH
                    if (interpolator < 0.99999)
                    {
                        half3 reflectionUV2 = getReflectionUV(reflDir, d.worldSpacePosition, unity_SpecCube1_ProbePosition, unity_SpecCube1_BoxMin, unity_SpecCube1_BoxMax);
                        half4 probe1 = UNITY_SAMPLE_TEXCUBE_SAMPLER_LOD(unity_SpecCube1, unity_SpecCube0, reflectionUV2, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        half3 probe1sample = DecodeHDR(probe1, unity_SpecCube1_HDR);
                        indirectSpecular = lerp(probe1sample, probe0sample, interpolator);
                    }
                    else
                    {
                        indirectSpecular = probe0sample;
                    }
            
                    if (!any(indirectSpecular))
                    {
                        indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                        indirectSpecular *= indirectLight;
                    }
                    spec = indirectSpecular * fresnel;
                }
                #endif
            
                #if defined(REFLECTION_MODE_BAKED_CUBEMAP) && defined(UNITY_PASS_FORWARDBASE)
                {
                    half3 indirectSpecular = SAMPLE_TEXTURECUBE_LOD(_BakedCubemap, sampler_BakedCubemap, reflDir, roughness * UNITY_SPECCUBE_LOD_STEPS);
                    indirectSpecular *= indirectLight;
                    spec = indirectSpecular * fresnel;
                }
                #endif
                return spec;
            }
            
            half3 calcDirectSpecular(MeshData d, SurfaceData o, float lightNoL, float NoH, float NoV, float lightLoH, half3 lightColor, half3 lightHalfVector, half anisotropy)
            {
                half specularIntensity = o.SpecularIntensity;
                half3 specular = half3(0,0,0);
                half smoothness = max(0.01, (o.SpecularArea));
                smoothness *= 1.7 - 0.7 * smoothness;
            
                float rough = max(smoothness * smoothness, 0.0045);
                float Dn = D_GGX(NoH, rough);
                float3 F = 1-F_Schlick(lightLoH, 0);
                float V = V_SmithGGXCorrelated(NoV, lightNoL, rough);
                float3 directSpecularNonAniso = max(0, (Dn * V) * F);
            
                anisotropy *= saturate(5.0 * smoothness);
                float at = max(rough * (1.0 + anisotropy), 0.001);
                float ab = max(rough * (1.0 - anisotropy), 0.001);
                float D = D_GGX_Anisotropic(NoH, lightHalfVector, d.worldSpaceTangent, d.bitangent, at, ab);
                float3 directSpecularAniso = max(0, (D * V) * F);
            
                specular = lerp(directSpecularNonAniso, directSpecularAniso, saturate(abs(anisotropy * 100)));
                specular = lerp(specular, smoothstep(0.5, 0.51, specular), o.SpecularSharpness) * 3 * lightColor.xyz * specularIntensity; // Multiply by 3 to bring up to brightness of standard
                specular *= lerp(1, o.Albedo, o.SpecularAlbedoTint);
                specular = clamp(specular, 0, specularIntensity);
                return specular;
            }
            
            half3 calcReflectionBlending(SurfaceData o, half reflectivity, half3 col, half3 indirectSpecular)
            {
                half3 reflection = indirectSpecular.xyzz * reflectivity;
            
                // Doing a Lerp allows shaders to smoothly transition between blend modes
                col = lerp(
                    col + reflection, // Additive
                    lerp(
                        lerp(col, col * indirectSpecular.xyz, reflectivity), // Multiplicitive
                        col - reflection, // Subtractive
                        saturate(o.ReflectionBlendMode - 1)
                    ),
                    saturate(o.ReflectionBlendMode)
                );
                return col;
            }
            
            half4 calcEmission(SurfaceData o, half lightAvg)
            {
                #if defined(UNITY_PASS_FORWARDBASE) // Emission only in Base Pass, and vertex lights
                    float4 emission = 0;
                    emission = half4(o.Emission, 1);
            
                    half intensity = length(emission.rgb);
                    half3 emissionHSV = RGB2HSV(normalize(emission.rgb));
                    emissionHSV.x = fmod(emissionHSV.x + o.Hue, 1);
                    emissionHSV.y = saturate(emissionHSV.y + o.Saturation);
                    emissionHSV.z = saturate(emissionHSV.z + o.Value);
                    emission.rgb = HSV2RGB(emissionHSV) * intensity;
            
                    float4 scaledEmission = emission * saturate(smoothstep(1 - o.EmissionLightThreshold, 1 + o.EmissionLightThreshold, 1 - lightAvg));
                    float4 em = lerp(emission, scaledEmission, o.EmissionScaleWithLight);
                    return em;
                #else
                    return 0;
                #endif
            }
            
            void XSToonLighting(MeshData d, FragmentData i, SurfaceData o, inout half4 FinalColor)
            {
                #if !defined(UNITY_PASS_SHADOWCASTER)
                half reflectance = o.Reflectivity;
                float oneMinusReflectivity = 1.0 - 0.04 - o.Metallic * (1.0 - 0.04);
                half3 f0 = 0.16 * reflectance * reflectance * (1 - o.Metallic) + o.Albedo * o.Metallic;
                half3 indirectDiffuse = 1;
                half3 indirectSpecular = 0;
                half3 directSpecular = 0;
                half occlusion = o.Occlusion;
                half perceptualRoughness = 1 - o.Smoothness;
                half3 tangentNormal = o.Normal;
                o.Normal = normalize(mul(o.Normal, d.TBNMatrix));
                half3 reflDir = calcReflView(d.worldSpaceViewDir, o.Normal);
            
                // Light Direction, based on method derived by Xiexe and Merlin
                #ifndef USING_DIRECTIONAL_LIGHT
                    half3 lightDir = UnityWorldSpaceLightDir(d.worldSpacePosition);
                #else
                    half3 lightDir = _WorldSpaceLightPos0.xyz;
                #endif
            
                half3 probeLightDir = unity_SHAr.xyz + unity_SHAg.xyz + unity_SHAb.xyz;
                lightDir = (lightDir + probeLightDir);
            
                #if !defined(POINT) && !defined(SPOT)
                if(length(unity_SHAr.xyz*unity_SHAr.w + unity_SHAg.xyz*unity_SHAg.w + unity_SHAb.xyz*unity_SHAb.w) == 0 && length(lightDir) < 0.1)
                {
                    lightDir = half4(1, 1, 1, 0);
                }
                #endif
                lightDir = Unity_SafeNormalize(lightDir);
            
                // Attenuation
                UNITY_LIGHT_ATTENUATION(lightAttenuation, i, d.worldSpacePosition);
            
                // fix for rare bug where light atten is 0 when there is no directional light in the scene
                #ifdef UNITY_PASS_FORWARDBASE
                    if(all(_LightColor0.rgb == 0.0))
                        lightAttenuation = 1.0;
                #endif
            
                #if defined(USING_DIRECTIONAL_LIGHT)
                    half sharp = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, lightAttenuation); //Converge at the center line
                #endif
            
                half3 lightColor = _LightColor0.rgb;
            
                half3 lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                half lightNoL = dot(o.Normal, lightDir);
                half lightLoH = dot(lightDir, lightHalfVector);
            
                half NoV = abs(dot(o.Normal, d.worldSpaceViewDir)) + 1e-5;
                half NoH = saturate(dot(o.Normal, lightHalfVector));
                half3 stereoViewDir = calcStereoViewDir(d.worldSpacePosition);
                half NoSVDN = abs(dot(stereoViewDir, o.Normal));
            
                // Aniso Refl
                half3 reflViewAniso = 0;
            
                float3 anisotropicDirection = o.Anisotropy >= 0.0 ? d.bitangent : d.worldSpaceTangent.xyz;
                float3 anisotropicTangent = cross(anisotropicDirection, d.worldSpaceViewDir);
                float3 anisotropicNormal = cross(anisotropicTangent, anisotropicDirection);
                float bendFactor = abs(o.Anisotropy) * saturate(5.0 * perceptualRoughness);
                float3 bentNormal = normalize(lerp(o.Normal, anisotropicNormal, bendFactor));
                reflViewAniso = reflect(-d.worldSpaceViewDir, bentNormal);
            
                // Indirect diffuse
                #if !defined(LIGHTMAP_ON)
                    half3 L0 = half3(unity_SHAr.w, unity_SHAg.w, unity_SHAb.w);
                    indirectDiffuse.r = shEvaluateDiffuseL1Geomerics(L0.r, unity_SHAr.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.g = shEvaluateDiffuseL1Geomerics(L0.g, unity_SHAg.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse.b = shEvaluateDiffuseL1Geomerics(L0.b, unity_SHAb.xyz, lerp(o.Normal, half3(0,0.5,0), _IgnoreLightprobeNormal));
                    indirectDiffuse = max(0, indirectDiffuse);
                #elif defined(UNITY_PASS_FORWARDBASE)
                    // This here is an attempt to provide a somewhat usable ramp for lightmaps
                    half2 lightmapUV = d.lightmapUv.xy;
                    half4 bakedColorTex = 0;
                    half3 lightMap = tex2DFastBicubicLightmap(lightmapUV, bakedColorTex);
            
                    // Support basic directionality
                    #if defined(DIRLIGHTMAP_COMBINED)
                        half4 lightMapDirection = tex2DFastBicubicSample(unity_LightmapInd, samplerunity_Lightmap, lightmapUV);
            
                        // use lightmap direction if we can, realtim light is ignored in that case
                        lightDir.xyz = lightMapDirection.xyz - 0.5;
                        lightHalfVector = Unity_SafeNormalize(lightDir + d.worldSpaceViewDir);
                        lightNoL = dot(o.Normal, lightDir);
                        lightLoH = dot(lightDir, lightHalfVector);
            
                        lightMap = DecodeDirectionalLightmap(lightMap, lightMapDirection, o.Normal);
            
                        lightColor = lightMap * 0.6;
                        indirectDiffuse = lightMap * 0.4;
                    #else
                        // Hacky way to support both cases of dirlight + baked and bakedy only but no directionality
                        // baked generates a light dir of 0,1,0
                        if (dot(lightDir.xyz, half3(0,1,0)) > 0.95) {
                            lightDir.xyz = 0;
                            lightNoL = 1;
                        }
                        indirectDiffuse = lightMap;
                    #endif
            
                    // we can end up using this twice, once above in the Dirlight logic and once here if both a realtime light
                    // and baked lightmap are present
                    half sharp2 = o.ShadowSharpness * 0.5;
                    lightAttenuation = smoothstep(sharp, 1 - sharp, saturate(length(lightMap)));
                #endif
                indirectDiffuse *= lerp(occlusion, 1, o.OcclusionMode);
            
                if (_MonochromeLighting > 0)
                {
                    indirectDiffuse = lerp(indirectDiffuse, dot(indirectDiffuse, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
            
                bool lightEnv = any(lightDir.xyz);
                // if there is no realtime light - we rely solely on probes
                if (!lightEnv) {
                    lightColor = indirectDiffuse * 0.6;
                    indirectDiffuse = indirectDiffuse * 0.4;
                }
            
                #if defined(UNITY_PASS_FORWARDBASE)
                indirectDiffuse = lerp(indirectDiffuse, max(indirectDiffuse, 0.05), _MinLight);
                #endif
            
                half lightAvg = (dot(indirectDiffuse.rgb, grayscaleVec) + dot(lightColor.rgb, grayscaleVec)) / 2;
            
                // Light Ramp
                half4 ramp = 1;
                half4 diffuse = 1;
                ramp = calcRamp(lightNoL, lightAttenuation, occlusion, o.OcclusionMode);
                // Begin Added
                if (_MonochromeLighting > 0)
                {
                    lightColor = lerp(lightColor, dot(lightColor, float3(0.299, 0.587, 0.114)), _MonochromeLighting);
                }
                // End Added
                diffuse = calcDiffuse(lightAttenuation, o.Albedo.rgb, indirectDiffuse, lightColor, ramp);
            
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                float4 vLightAttenuations = 0;
                float4x4 vLightColors = getVertexLightsColors(d.worldSpacePosition, o.Normal, vLightAttenuations, false);
                float4x4 vLightDirections = getVertexLightsDir(d.worldSpacePosition);
                float4x4 vLightHalfVectors = 0;
                float4 vLightNoLs = 0;
                float4 vLightLoHs = 0;
                half4 vRamp = 1;
            
                [unroll(4)]
                for (int i = 0; i < 4; i++)
                {
                    vLightHalfVectors[i].rgb = Unity_SafeNormalize(vLightDirections[i] + d.worldSpaceViewDir);
                    vLightLoHs[i] = saturate(dot(vLightDirections[i], vLightHalfVectors[i]));
                    vLightNoLs[i] = saturate(dot(o.Normal, vLightDirections[i]));
                    vRamp = calcRamp(vLightNoLs[i], vLightAttenuations[i], occlusion, o.OcclusionMode);
                    diffuse += calcDiffuse(vLightAttenuations[i], o.Albedo.rgb, 0, vLightColors[i], vRamp);
                }
                #endif
            
                // Rims
                half3 rimLight = 0;
                #if defined(RIMLIGHT_ON)
                rimLight = o.RimLight.rgb;
                rimLight *= lightColor.xyz + indirectDiffuse.xyz;
                rimLight *= lerp(1, lightAttenuation + indirectDiffuse.xyz, o.RimAttenuation);
                #endif
            
                half3 rimShadow = 1;
                #if defined(RIMSHADOW_ON)
                rimShadow = o.RimShadow;
                #endif
            
                float3 fresnel = F_Schlick(NoV, f0);
            
                #if !defined(REFLECTION_MODE_OFF)
                indirectSpecular = calcIndirectSpecular(lightAttenuation, d, o, perceptualRoughness, reflViewAniso, indirectDiffuse, fresnel, ramp) * occlusion;
                #endif
            
                #if defined(SPECULAR_ON)
                directSpecular = calcDirectSpecular(d, o, lightNoL, NoH, NoV, lightLoH, lightColor, lightHalfVector, o.SpecularAnisotropy) * lightNoL * occlusion * lightAttenuation;
                #if defined(VERTEXLIGHT_ON) && defined(UNITY_PASS_FORWARDBASE)
                {
                    [unroll(4)]
                    for (int i = 0; i < 4; i++)
                    {
                        directSpecular += calcDirectSpecular(d, o, vLightNoLs[i], vLightLoHs[i], NoV, vLightLoHs[i], vLightColors[i], vLightHalfVectors[i], o.SpecularAnisotropy) * vLightNoLs[i] * occlusion * vLightAttenuations[i];
                    }
                }
                #endif
                #endif
            
                // Standard-Like transparent (premult alpha)
                if (_RenderType == 2)
                {
                    diffuse.rgb *= o.Alpha;
                    o.Alpha = 1 - (oneMinusReflectivity) + o.Alpha * (oneMinusReflectivity);
                }
            
                #if !defined(_NATIVE_A2C)
                {
                    // Standard-Like cutout
                    if (_RenderType == 1)
                    {
                        clip(o.Alpha - _Cutoff);
                    }
                }
                #endif
            
                FinalColor.rgb = diffuse.rgb * rimShadow.rgb;
            
                #if !defined(REFLECTION_MODE_OFF)
                FinalColor.rgb = calcReflectionBlending(o, reflectance, FinalColor.rgb, indirectSpecular);
                #endif
            
                FinalColor.rgb += max(directSpecular.xyz, rimLight.rgb).rgb;
                FinalColor.rgb += calcEmission(o, lightAvg);
            
                // Outline
                #if defined(PASS_OUTLINE)
                    half3 outlineColor = 0;
                    half3 ol = o.OutlineColor;
                    outlineColor = ol * saturate(lightAttenuation * lightNoL) * lightColor.rgb;
                    outlineColor += indirectDiffuse * ol;
                    outlineColor = lerp(outlineColor, ol, o.OutlineLightingMode);
                    FinalColor.rgb = outlineColor;
                #endif
            
                FinalColor.a = o.Alpha;
            
                // Premulty output by alpha for correct `Fade` mode
                #if defined(UNITY_PASS_FORWARDADD)
                if (_RenderType == 3)
                {
                    FinalColor.rgb *= o.Alpha;
                }
                #endif
            
                #endif
            }
            

            void VertexBase(inout VertexData v, inout FragmentData o)
            {
                #if defined(UNITY_PASS_META) && !defined(UNITY_PASS_BAKERY_META)
                o.pos = UnityMetaVertexPosition(v.vertex, v.uv1.xy, v.uv2.xy, unity_LightmapST, unity_DynamicLightmapST);
                #else
                o.pos = TransformObjectToHClip(v.vertex);
                #endif
                o.normal = v.normal;
                o.uv0 = v.uv0;
                o.uv1 = v.uv1;
                o.uv2 = v.uv2;
                o.uv3 = v.uv3;
                #if defined(NEED_UV4)
                o.uv4 = v.uv4;
                #endif
                #if defined(NEED_UV5)
                o.uv5 = v.uv5;
                #endif
                #if defined(NEED_UV6)
                o.uv6 = v.uv6;
                #endif
                #if defined(NEED_UV7)
                o.uv7 = v.uv7;
                #endif
                o.worldPos = mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1));
                o.worldNormal = UnityObjectToWorldNormal(v.normal);
                o.worldTangent.xyz = UnityObjectToWorldDir(v.tangent.xyz);
                o.worldTangent.w = v.tangent.w * unity_WorldTransformParams.w;
                o.vertexColor = v.color;
            
                #if defined(EDITOR_VISUALIZATION)
                o.vizUV = 0;
                o.lightCoord = 0;
                if (unity_VisualizationMode == EDITORVIZ_TEXTURE)
                {
                    o.vizUV = UnityMetaVizUV(unity_EditorViz_UVIndex, v.uv0.xy, v.uv1.xy, v.uv2.xy, unity_EditorViz_Texture_ST);
                }
                else if (unity_VisualizationMode == EDITORVIZ_SHOWLIGHTMASK)
                {
                    o.vizUV = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    o.lightCoord = mul(unity_EditorViz_WorldToLight, mul(unity_ObjectToWorld, float4(v.vertex.xyz, 1)));
                }
                #endif
            
                #if defined(NEED_SCREEN_POS)
                o.screenPos = GetScreenPosition(o.pos);
                o.screenPos.z = -TransformWorldToView(TransformObjectToWorld(v.vertex)).z;
                #endif
            
                #if !defined(UNITY_PASS_META)
                    #if defined(LIGHTMAP_ON)
                    o.lightmapUv.xy = v.uv1.xy * unity_LightmapST.xy + unity_LightmapST.zw;
                    #endif
                    #if defined(DYNAMICLIGHTMAP_ON)
                    o.lightmapUv.zw = v.uv2.xy * unity_DynamicLightmapST.xy + unity_DynamicLightmapST.zw;
                    #endif
                        
                    UNITY_TRANSFER_LIGHTING(o, v.uv1.xy);
                    
                    #if !defined(UNITY_PASS_FORWARDADD)
                        // unity does some funky stuff for different platforms with these macros
                        #ifdef FOG_COMBINED_WITH_TSPACE
                            UNITY_TRANSFER_FOG_COMBINED_WITH_TSPACE(o, o.pos);
                        #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                            UNITY_TRANSFER_FOG_COMBINED_WITH_WORLD_POS(o, o.pos);
                        #else
                            UNITY_TRANSFER_FOG(o, o.pos);
                        #endif
                    #else
                        UNITY_TRANSFER_FOG(o, o.pos);
                    #endif
                #endif
            }
            

            // Free Functions

            // Outline Vertex
            #if !defined(TESS_ENABLED)
            FragmentData Vertex(VertexData v)
            {
                UNITY_SETUP_INSTANCE_ID(v);
                FragmentData o;
                UNITY_INITIALIZE_OUTPUT(FragmentData, o);
                UNITY_TRANSFER_INSTANCE_ID(v, o);
                UNITY_INITIALIZE_VERTEX_OUTPUT_STEREO(o);
                
                #if defined(OUTLINE_ENABLED)

                // Outline Vertex Chain
                VRCFeaturesVertex(v);

                ToonOutlineVertex(v);

                AudioLinkVertex(v);

                // Outline VertexBase
                VertexBase(v, o);

                // Outline PostVertex Chain

                return o;

                #else
                
                o.pos = asfloat(-1);
                return o;

                #endif
            }
            #endif

            // Outline Fragment
            half4 Fragment(FragmentData i, bool facing: SV_IsFrontFace) : SV_TARGET
            {
                #if defined(OUTLINE_ENABLED)

                UNITY_SETUP_INSTANCE_ID(i);
                UNITY_SETUP_STEREO_EYE_INDEX_POST_VERTEX(i);
                #ifdef FOG_COMBINED_WITH_TSPACE
                    UNITY_EXTRACT_FOG_FROM_TSPACE(i);
                #elif defined(FOG_COMBINED_WITH_WORLD_POS)
                    UNITY_EXTRACT_FOG_FROM_WORLD_POS(i);
                #else
                    UNITY_EXTRACT_FOG(i);
                #endif

                SurfaceData o = CreateSurfaceData();
                MeshData d = CreateMeshData(i, facing);
                half4 FinalColor = 1;

                // Outline Fragment Chain
                ToonMainFragment(d, o, facing);

                ToonOcclusionFragment(d, o);

                ToonNormalsFragment(d, o);

                ToonOutlineFragment(d, o);

                ToonSpecularFragment(d, o);

                ToonReflectionFragment(d, o);

                ToonALFragment(d, o);

                ToonEmissionFragment(o);

                ToonRimLightFragment(d, o);

                ToonShadowRimFragment(d, o);

                ChromaFrag(d, o);

                LumaFrag(d, o);

                VideoFrag(d, o);

                CrowdwaveFrag(d, o);

                Toon_SheenFragment(d, o);

                // Outline FragmentBase
                XSToonLighting(d, i, o, FinalColor);

                UNITY_APPLY_FOG(_unity_fogCoord, FinalColor);
                
                // Outline Color Chain
                LTCGIColor(d, i, o, FinalColor, facing);

                return FinalColor;

                #else

                return half4(0.2,0.2,0.2,0);

                #endif
            }

            ENDCG
            // Outline Pass End
        }

        // ExtraPasses

        // PostPasses
    }
    CustomEditor "ORL.ShaderInspector.InspectorGUI"
}

