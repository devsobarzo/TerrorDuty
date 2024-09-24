// Compiled shader for Windows, Mac, Linux

//////////////////////////////////////////////////////////////////////////
// 
// NOTE: This is *not* a valid shader file, the contents are provided just
// for information and for debugging purposes only.
// 
//////////////////////////////////////////////////////////////////////////
// Skipping shader variants that would not be included into build of current scene.

Shader "Particles/Standard Unlit" {
Properties {
 _MainTex ("Albedo", 2D) = "white" { }
 _Color ("Color", Color) = (1.000000,1.000000,1.000000,1.000000)
 _Cutoff ("Alpha Cutoff", Range(0.000000,1.000000)) = 0.500000
 _BumpScale ("Scale", Float) = 1.000000
 _BumpMap ("Normal Map", 2D) = "bump" { }
 _EmissionColor ("Color", Color) = (0.000000,0.000000,0.000000,1.000000)
 _EmissionMap ("Emission", 2D) = "white" { }
 _DistortionStrength ("Strength", Float) = 1.000000
 _DistortionBlend ("Blend", Range(0.000000,1.000000)) = 0.500000
 _SoftParticlesNearFadeDistance ("Soft Particles Near Fade", Float) = 0.000000
 _SoftParticlesFarFadeDistance ("Soft Particles Far Fade", Float) = 1.000000
 _CameraNearFadeDistance ("Camera Near Fade", Float) = 1.000000
 _CameraFarFadeDistance ("Camera Far Fade", Float) = 2.000000
[HideInInspector]  _Mode ("__mode", Float) = 0.000000
[HideInInspector]  _ColorMode ("__colormode", Float) = 0.000000
[HideInInspector]  _FlipbookMode ("__flipbookmode", Float) = 0.000000
[HideInInspector]  _LightingEnabled ("__lightingenabled", Float) = 0.000000
[HideInInspector]  _DistortionEnabled ("__distortionenabled", Float) = 0.000000
[HideInInspector]  _EmissionEnabled ("__emissionenabled", Float) = 0.000000
[HideInInspector]  _BlendOp ("__blendop", Float) = 0.000000
[HideInInspector]  _SrcBlend ("__src", Float) = 1.000000
[HideInInspector]  _DstBlend ("__dst", Float) = 0.000000
[HideInInspector]  _ZWrite ("__zw", Float) = 1.000000
[HideInInspector]  _Cull ("__cull", Float) = 2.000000
[HideInInspector]  _SoftParticlesEnabled ("__softparticlesenabled", Float) = 0.000000
[HideInInspector]  _CameraFadingEnabled ("__camerafadingenabled", Float) = 0.000000
[HideInInspector]  _SoftParticleFadeParams ("__softparticlefadeparams", Vector) = (0.000000,0.000000,0.000000,0.000000)
[HideInInspector]  _CameraFadeParams ("__camerafadeparams", Vector) = (0.000000,0.000000,0.000000,0.000000)
[HideInInspector]  _ColorAddSubDiff ("__coloraddsubdiff", Vector) = (0.000000,0.000000,0.000000,0.000000)
[HideInInspector]  _DistortionStrengthScaled ("__distortionstrengthscaled", Float) = 0.000000
}
SubShader { 
 Tags { "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "PreviewType"="Plane" "PerformanceChecks"="False" }
 GrabPass {
  "_GrabTexture"
  Tags { "LIGHTMODE"="GRABPASS" }
 }
 Pass {
  Name "ShadowCaster"
  Tags { "LIGHTMODE"="SHADOWCASTER" "IGNOREPROJECTOR"="true" "SHADOWSUPPORT"="true" "RenderType"="Opaque" "PreviewType"="Plane" "PerformanceChecks"="False" }
  Cull Off
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_CUBE _ALPHATEST_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 _MainTex_ST at 224
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (4 bytes) on slot 0 {
  Float _Cutoff at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, (-FGlobals._Cutoff));
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_CUBE _ALPHABLEND_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 _MainTex_ST at 224
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, -0.5);
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat9;
    bool u_xlatb9;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH _ALPHATEST_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 _MainTex_ST at 224
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (4 bytes) on slot 0 {
  Float _Cutoff at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, (-FGlobals._Cutoff));
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: SHADOWS_DEPTH _ALPHABLEND_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (240 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 32
  Matrix4x4 unity_WorldToObject at 96
  Matrix4x4 unity_MatrixVP at 160
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 _MainTex_ST at 224
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_WorldToObject[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float4 u_xlat2;
    float u_xlat6;
    float u_xlat9;
    bool u_xlatb9;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat0.x = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[0].xyz);
    u_xlat0.y = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[1].xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, VGlobals.hlslcc_mtx4x4unity_WorldToObject[2].xyz);
    u_xlat9 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat0.xyz = float3(u_xlat9) * u_xlat0.xyz;
    u_xlat1 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3], input.POSITION0.wwww, u_xlat1);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat9 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat9 = rsqrt(u_xlat9);
    u_xlat2.xyz = float3(u_xlat9) * u_xlat2.xyz;
    u_xlat9 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat9 = fma((-u_xlat9), u_xlat9, 1.0);
    u_xlat9 = sqrt(u_xlat9);
    u_xlat9 = u_xlat9 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat9), u_xlat1.xyz);
    u_xlatb9 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb9)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat2 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat2);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat1.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat6 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat6);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat6) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat6);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, -0.5);
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_DEPTH
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (96 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat14 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat14);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat14) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat14);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_CUBE _ALPHATEST_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 unity_ParticleUVShiftData at 96
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat7.x = as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x34 >> 2) + 0]);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat14 = u_xlat7.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat14 = floor(u_xlat14);
    u_xlat7.x = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.y, u_xlat7.x);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat1.x = u_xlat7.x * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat7.x = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.w, u_xlat7.x);
    u_xlat7.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb21 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat7.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (4 bytes) on slot 0 {
  Float _Cutoff at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, (-FGlobals._Cutoff));
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_CUBE _ALPHABLEND_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 unity_ParticleUVShiftData at 96
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat7.x = as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x34 >> 2) + 0]);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat14 = u_xlat7.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat14 = floor(u_xlat14);
    u_xlat7.x = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.y, u_xlat7.x);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat1.x = u_xlat7.x * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat7.x = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.w, u_xlat7.x);
    u_xlat7.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb21 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat7.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 3D Texture "_DitherMaskLOD" to slot 1

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_DitherMaskLOD [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture3d<float, access::sample > _DitherMaskLOD [[ texture(1) ]] ,
    float4 mtl_FragCoord [[ position ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
    float3 u_xlat0;
    bool u_xlatb0;
    u_xlat0.x = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat0.x * input.TEXCOORD3.w;
    u_xlat0.z = u_xlat0.x * 0.9375;
    u_xlat0.xy = hlslcc_FragCoord.xy * float2(0.25, 0.25);
    u_xlat0.x = _DitherMaskLOD.sample(sampler_DitherMaskLOD, u_xlat0.xyz).w;
    u_xlat0.x = u_xlat0.x + -0.00999999978;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_CUBE
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"

Constant Buffer "VGlobals" (96 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = min(u_xlat0.w, u_xlat0.z);
    u_xlat1.x = (-u_xlat0.z) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat1.x, u_xlat0.z);
    output.mtl_Position.xyw = u_xlat0.xyw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
)
{
    Mtl_FragmentOut output;
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_DEPTH _ALPHATEST_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 unity_ParticleUVShiftData at 96
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat7.x = as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x34 >> 2) + 0]);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat14 = u_xlat7.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat14 = floor(u_xlat14);
    u_xlat7.x = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.y, u_xlat7.x);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat1.x = u_xlat7.x * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat7.x = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.w, u_xlat7.x);
    u_xlat7.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb21 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat7.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat14 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat14);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat14) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat14);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (4 bytes) on slot 0 {
  Float _Cutoff at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float u_xlat0;
    bool u_xlatb0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0 = fma(u_xlat0, input.TEXCOORD3.w, (-FGlobals._Cutoff));
    u_xlatb0 = u_xlat0<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SHADOWS_DEPTH _ALPHABLEND_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Normal"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (128 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 32
  Vector4 _WorldSpaceLightPos0 at 0
  Vector4 unity_LightShadowBias at 16
  Vector4 unity_ParticleUVShiftData at 96
  Vector4 _MainTex_ST at 112
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _WorldSpaceLightPos0;
    float4 unity_LightShadowBias;
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float3 NORMAL0 [[ attribute(1) ]] ;
    float4 COLOR0 [[ attribute(2) ]] ;
    float2 TEXCOORD0 [[ attribute(3) ]] ;
};

struct Mtl_VertexOut
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
    float4 mtl_Position [[ position, invariant ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    int u_xlati0;
    float4 u_xlat1;
    float4 u_xlat2;
    float4 u_xlat3;
    float3 u_xlat4;
    float3 u_xlat5;
    float3 u_xlat6;
    float3 u_xlat7;
    float u_xlat14;
    float u_xlat21;
    bool u_xlatb21;
    u_xlati0 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat7.x = as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x34 >> 2) + 0]);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat14 = u_xlat7.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat14 = floor(u_xlat14);
    u_xlat7.x = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.y, u_xlat7.x);
    u_xlat7.x = floor(u_xlat7.x);
    u_xlat1.x = u_xlat7.x * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat7.x = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat14), VGlobals.unity_ParticleUVShiftData.w, u_xlat7.x);
    u_xlat7.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb21 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat7.xy = (bool(u_xlatb21)) ? u_xlat7.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat7.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    output.TEXCOORD3 = input.COLOR0;
    u_xlat1.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x18 >> 2) + 0]));
    u_xlat2.z = u_xlat1.y;
    u_xlat3.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x0 >> 2) + 2]));
    u_xlat2.x = u_xlat3.z;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0xc >> 2) + 2]));
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati0].value[(0x24 >> 2) + 2]));
    u_xlat2.y = u_xlat7.z;
    u_xlat3.z = u_xlat1.x;
    u_xlat1.x = u_xlat3.y;
    u_xlat1.y = u_xlat7.x;
    u_xlat3.y = u_xlat7.y;
    u_xlat0.xyz = u_xlat2.zxy * u_xlat1.yzx;
    u_xlat0.xyz = fma(u_xlat1.zxy, u_xlat2.yzx, (-u_xlat0.xyz));
    u_xlat5.xyz = u_xlat2.yzx * u_xlat3.zxy;
    u_xlat5.xyz = fma(u_xlat3.yzx, u_xlat2.zxy, (-u_xlat5.xyz));
    u_xlat21 = dot(u_xlat1.xyz, u_xlat5.xyz);
    u_xlat21 = float(1.0) / float(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat0.y = dot(input.NORMAL0.xyz, u_xlat0.xyz);
    u_xlat6.xyz = u_xlat1.zxy * u_xlat3.yzx;
    u_xlat6.xyz = fma(u_xlat1.yzx, u_xlat3.zxy, (-u_xlat6.xyz));
    u_xlat6.xyz = float3(u_xlat21) * u_xlat6.xyz;
    u_xlat5.xyz = float3(u_xlat21) * u_xlat5.xyz;
    u_xlat0.x = dot(input.NORMAL0.xyz, u_xlat5.xyz);
    u_xlat0.z = dot(input.NORMAL0.xyz, u_xlat6.xyz);
    u_xlat21 = dot(u_xlat0.xyz, u_xlat0.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat0.xyz = float3(u_xlat21) * u_xlat0.xyz;
    u_xlat1.w = u_xlat4.x;
    u_xlat1.x = dot(u_xlat1, input.POSITION0);
    u_xlat3.w = u_xlat4.y;
    u_xlat2.w = u_xlat4.z;
    u_xlat1.z = dot(u_xlat2, input.POSITION0);
    u_xlat1.y = dot(u_xlat3, input.POSITION0);
    u_xlat2.xyz = fma((-u_xlat1.xyz), VGlobals._WorldSpaceLightPos0.www, VGlobals._WorldSpaceLightPos0.xyz);
    u_xlat21 = dot(u_xlat2.xyz, u_xlat2.xyz);
    u_xlat21 = rsqrt(u_xlat21);
    u_xlat2.xyz = float3(u_xlat21) * u_xlat2.xyz;
    u_xlat21 = dot(u_xlat0.xyz, u_xlat2.xyz);
    u_xlat21 = fma((-u_xlat21), u_xlat21, 1.0);
    u_xlat21 = sqrt(u_xlat21);
    u_xlat21 = u_xlat21 * VGlobals.unity_LightShadowBias.z;
    u_xlat0.xyz = fma((-u_xlat0.xyz), float3(u_xlat21), u_xlat1.xyz);
    u_xlatb21 = VGlobals.unity_LightShadowBias.z!=0.0;
    u_xlat0.xyz = (bool(u_xlatb21)) ? u_xlat0.xyz : u_xlat1.xyz;
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], input.POSITION0.wwww, u_xlat0);
    u_xlat1.x = VGlobals.unity_LightShadowBias.x / u_xlat0.w;
    u_xlat1.x = min(u_xlat1.x, 0.0);
    u_xlat1.x = max(u_xlat1.x, -1.0);
    u_xlat14 = u_xlat0.z + u_xlat1.x;
    u_xlat1.x = min(u_xlat0.w, u_xlat14);
    output.mtl_Position.xyw = u_xlat0.xyw;
    u_xlat0.x = (-u_xlat14) + u_xlat1.x;
    output.mtl_Position.z = fma(VGlobals.unity_LightShadowBias.y, u_xlat0.x, u_xlat14);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0
Set 3D Texture "_DitherMaskLOD" to slot 1

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct Mtl_FragmentIn
{
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    sampler sampler_MainTex [[ sampler (0) ]],
    sampler sampler_DitherMaskLOD [[ sampler (1) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    texture3d<float, access::sample > _DitherMaskLOD [[ texture(1) ]] ,
    float4 mtl_FragCoord [[ position ]],
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 hlslcc_FragCoord = float4(mtl_FragCoord.xyz, 1.0/mtl_FragCoord.w);
    float3 u_xlat0;
    bool u_xlatb0;
    u_xlat0.x = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).w;
    u_xlat0.x = u_xlat0.x * input.TEXCOORD3.w;
    u_xlat0.z = u_xlat0.x * 0.9375;
    u_xlat0.xy = hlslcc_FragCoord.xy * float2(0.25, 0.25);
    u_xlat0.x = _DitherMaskLOD.sample(sampler_DitherMaskLOD, u_xlat0.xyz).w;
    u_xlat0.x = u_xlat0.x + -0.00999999978;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0 = float4(0.0, 0.0, 0.0, 0.0);
    return output;
}


 }
 Pass {
  Tags { "IGNOREPROJECTOR"="true" "RenderType"="Opaque" "PreviewType"="Plane" "PerformanceChecks"="False" }
  ZWrite [_ZWrite]
  Cull [_Cull]
  Blend [_SrcBlend] [_DstBlend]
 BlendOp [_BlendOp]
  ColorMask RGB
  //////////////////////////////////
  //                              //
  //      Compiled programs       //
  //                              //
  //////////////////////////////////
//////////////////////////////////////////////////////
Keywords: <none>
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (144 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 0
  Matrix4x4 unity_MatrixVP at 64
  Vector4 _MainTex_ST at 128
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    output.mtl_Position = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.COLOR0 = input.COLOR0;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (112 bytes) on slot 0 {
  Matrix4x4 unity_MatrixVP at 0
  Vector4 unity_ParticleUVShiftData at 64
  Float unity_ParticleUseMeshColors at 80
  Vector4 _MainTex_ST at 96
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float unity_ParticleUseMeshColors;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
template <int N> vec<uint, N> bitFieldExtractU(const vec<uint, N> width, const vec<uint, N> offset, const vec<uint, N> src)
{
	vec<bool, N> isWidthZero = (width == 0);
	vec<bool, N> needsClamp = ((width + offset) < 32);
	vec<uint, N> clampVersion = src << (32-(width+offset));
	clampVersion = clampVersion >> (32 - width);
	vec<uint, N> simpleVersion = src >> offset;
	vec<uint, N> res = select(simpleVersion, clampVersion, needsClamp);
	return select(res, vec<uint, N>(0), isWidthZero);
}; 
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    float2 u_xlat1;
    int u_xlati1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float u_xlat6;
    float3 u_xlat7;
    uint3 u_xlatu7;
    bool u_xlatb12;
    float u_xlat13;
    u_xlat0.xyz = input.POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat2.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 1]));
    u_xlat3.x = u_xlat2.z;
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 2]));
    u_xlat3.y = u_xlat4.x;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 2]));
    u_xlat3.z = u_xlat7.y;
    u_xlat5 = float4(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 3]));
    u_xlat1.x = as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x34 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.w = u_xlat5.y;
    u_xlat13 = dot(u_xlat3, u_xlat0);
    u_xlat3 = float4(u_xlat13) * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat4.x = u_xlat2.y;
    u_xlat2.y = u_xlat4.z;
    u_xlat4.z = u_xlat7.x;
    u_xlat2.z = u_xlat7.z;
    u_xlat4.w = u_xlat5.x;
    u_xlat7.x = dot(u_xlat4, u_xlat0);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat7.xxxx, u_xlat3);
    u_xlat2.w = u_xlat5.z;
    u_xlat0.x = dot(u_xlat2, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.xxxx, u_xlat3);
    output.mtl_Position = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    u_xlat0 = input.COLOR0 + float4(-1.0, -1.0, -1.0, -1.0);
    u_xlat0 = fma(float4(VGlobals.unity_ParticleUseMeshColors), u_xlat0, float4(1.0, 1.0, 1.0, 1.0));
    u_xlatu7.x = as_type<uint>(u_xlat5.w) & 0xffu;
    u_xlat2.x = float(u_xlatu7.x);
    u_xlatu7.xy = bitFieldExtractU(uint2(0x8u, 0x8u), uint2(0x8u, 0x10u), as_type<uint2>(u_xlat5.ww));
    u_xlatu7.z = as_type<uint>(u_xlat5.w) >> 0x18u;
    u_xlat2.yzw = float3(u_xlatu7.xyz);
    u_xlat0 = u_xlat0 * u_xlat2;
    output.COLOR0 = u_xlat0 * float4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    u_xlat0.x = u_xlat1.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat0.x = floor(u_xlat0.x);
    u_xlat6 = fma((-u_xlat0.x), VGlobals.unity_ParticleUVShiftData.y, u_xlat1.x);
    u_xlat6 = floor(u_xlat6);
    u_xlat1.x = u_xlat6 * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat6 = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat0.x), VGlobals.unity_ParticleUVShiftData.w, u_xlat6);
    u_xlat0.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb12 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat0.xy = (bool(u_xlatb12)) ? u_xlat0.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: _ALPHATEST_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (20 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Cutoff at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float u_xlat3;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    u_xlat3 = fma(u_xlat0.w, input.COLOR0.w, (-FGlobals._Cutoff));
    u_xlat0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat3 + 9.99999975e-05;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: _ALPHABLEND_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    output.SV_Target0 = u_xlat0 * input.COLOR0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON _ALPHATEST_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (20 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Cutoff at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float u_xlat3;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    u_xlat3 = fma(u_xlat0.w, input.COLOR0.w, (-FGlobals._Cutoff));
    u_xlat0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat3 + 9.99999975e-05;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON _ALPHABLEND_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    output.SV_Target0 = u_xlat0 * input.COLOR0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SOFTPARTICLES_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (224 bytes) on slot 0 {
  Matrix4x4 unity_ObjectToWorld at 16
  Matrix4x4 unity_MatrixV at 80
  Matrix4x4 unity_MatrixVP at 144
  Vector4 _ProjectionParams at 0
  Vector4 _MainTex_ST at 208
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_ObjectToWorld[4];
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 _MainTex_ST;
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    float u_xlat2;
    u_xlat0 = input.POSITION0.yyyy * VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[1];
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[0], input.POSITION0.xxxx, u_xlat0);
    u_xlat0 = fma(VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[2], input.POSITION0.zzzz, u_xlat0);
    u_xlat0 = u_xlat0 + VGlobals.hlslcc_mtx4x4unity_ObjectToWorld[3];
    u_xlat1 = u_xlat0.yyyy * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat0.xxxx, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.zzzz, u_xlat1);
    u_xlat1 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[3], u_xlat0.wwww, u_xlat1);
    output.mtl_Position = u_xlat1;
    output.COLOR0 = input.COLOR0;
    output.TEXCOORD1.xy = fma(input.TEXCOORD0.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat2 = u_xlat0.y * VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat0.x = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z, u_xlat0.x, u_xlat2);
    u_xlat0.x = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z, u_xlat0.z, u_xlat0.x);
    u_xlat0.x = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[3].z, u_xlat0.w, u_xlat0.x);
    output.TEXCOORD3.z = (-u_xlat0.x);
    u_xlat0.x = u_xlat1.y * VGlobals._ProjectionParams.x;
    u_xlat0.w = u_xlat0.x * 0.5;
    u_xlat0.xz = u_xlat1.xw * float2(0.5, 0.5);
    output.TEXCOORD3.w = u_xlat1.w;
    output.TEXCOORD3.xy = u_xlat0.zz + u_xlat0.xw;
    return output;
}


-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SOFTPARTICLES_ON
-- Hardware tier variant: Tier 1
-- Vertex shader for "metal":
Uses vertex data channel "Vertex"
Uses vertex data channel "Color"
Uses vertex data channel "TexCoord0"

Constant Buffer "VGlobals" (192 bytes) on slot 0 {
  Matrix4x4 unity_MatrixV at 16
  Matrix4x4 unity_MatrixVP at 80
  Vector4 _ProjectionParams at 0
  Vector4 unity_ParticleUVShiftData at 144
  Float unity_ParticleUseMeshColors at 160
  Vector4 _MainTex_ST at 176
}
Constant Buffer "UnityDrawCallInfo" (8 bytes) on slot 1 {
  ScalarInt unity_BaseInstanceID at 0
}

Set Buffer  "unity_ParticleInstanceData" to slot 2

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
struct VGlobals_Type
{
    float4 _ProjectionParams;
    float4 hlslcc_mtx4x4unity_MatrixV[4];
    float4 hlslcc_mtx4x4unity_MatrixVP[4];
    float4 unity_ParticleUVShiftData;
    float unity_ParticleUseMeshColors;
    float4 _MainTex_ST;
};

struct UnityDrawCallInfo_Type
{
    int unity_BaseInstanceID;
    int unity_InstanceCount;
};

struct unity_ParticleInstanceData_Type
{
    uint value[14];
};

struct Mtl_VertexIn
{
    float4 POSITION0 [[ attribute(0) ]] ;
    float4 COLOR0 [[ attribute(1) ]] ;
    float2 TEXCOORD0 [[ attribute(2) ]] ;
};

struct Mtl_VertexOut
{
    float4 mtl_Position [[ position, invariant ]];
    float4 COLOR0 [[ user(COLOR0) ]];
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]];
    float4 TEXCOORD3 [[ user(TEXCOORD3) ]];
};

constant bool has_base_vertex_instance [[ function_constant(4) ]];
template <int N> vec<uint, N> bitFieldExtractU(const vec<uint, N> width, const vec<uint, N> offset, const vec<uint, N> src)
{
	vec<bool, N> isWidthZero = (width == 0);
	vec<bool, N> needsClamp = ((width + offset) < 32);
	vec<uint, N> clampVersion = src << (32-(width+offset));
	clampVersion = clampVersion >> (32 - width);
	vec<uint, N> simpleVersion = src >> offset;
	vec<uint, N> res = select(simpleVersion, clampVersion, needsClamp);
	return select(res, vec<uint, N>(0), isWidthZero);
}; 
vertex Mtl_VertexOut xlatMtlMain(
    constant VGlobals_Type& VGlobals [[ buffer(0) ]],
    constant UnityDrawCallInfo_Type& UnityDrawCallInfo [[ buffer(1) ]],
    const device unity_ParticleInstanceData_Type *unity_ParticleInstanceData [[ buffer(2) ]],
    uint mtl_InstanceID [[ instance_id ]],
    uint mtl_BaseInstance [[ base_instance, function_constant(has_base_vertex_instance) ]],
    Mtl_VertexIn input [[ stage_in ]])
{
    if(has_base_vertex_instance)
        mtl_InstanceID = mtl_InstanceID - mtl_BaseInstance;
    Mtl_VertexOut output;
    float4 u_xlat0;
    float4 u_xlat1;
    int u_xlati1;
    float4 u_xlat2;
    float4 u_xlat3;
    float4 u_xlat4;
    float4 u_xlat5;
    float3 u_xlat7;
    uint2 u_xlatu7;
    float u_xlat12;
    uint u_xlatu12;
    bool u_xlatb12;
    float u_xlat13;
    u_xlat0.xyz = input.POSITION0.xyz;
    u_xlat0.w = 1.0;
    u_xlati1 = int(mtl_InstanceID) + UnityDrawCallInfo.unity_BaseInstanceID;
    u_xlat2.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x0 >> 2) + 1]));
    u_xlat3.x = u_xlat2.z;
    u_xlat4.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0xc >> 2) + 2]));
    u_xlat3.y = u_xlat4.x;
    u_xlat7.xyz = float3(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x18 >> 2) + 2]));
    u_xlat3.z = u_xlat7.y;
    u_xlat5 = float4(as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 0]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 1]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 2]), as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x24 >> 2) + 3]));
    u_xlat1.x = as_type<float>(unity_ParticleInstanceData[u_xlati1].value[(0x34 >> 2) + 0]);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat3.w = u_xlat5.y;
    u_xlat13 = dot(u_xlat3, u_xlat0);
    u_xlat3 = float4(u_xlat13) * VGlobals.hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat13 = u_xlat13 * VGlobals.hlslcc_mtx4x4unity_MatrixV[1].z;
    u_xlat4.x = u_xlat2.y;
    u_xlat2.y = u_xlat4.z;
    u_xlat4.z = u_xlat7.x;
    u_xlat2.z = u_xlat7.z;
    u_xlat4.w = u_xlat5.x;
    u_xlat7.x = dot(u_xlat4, u_xlat0);
    u_xlat3 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[0], u_xlat7.xxxx, u_xlat3);
    u_xlat7.x = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[0].z, u_xlat7.x, u_xlat13);
    u_xlat2.w = u_xlat5.z;
    u_xlat0.x = dot(u_xlat2, u_xlat0);
    u_xlat2 = fma(VGlobals.hlslcc_mtx4x4unity_MatrixVP[2], u_xlat0.xxxx, u_xlat3);
    u_xlat0.x = fma(VGlobals.hlslcc_mtx4x4unity_MatrixV[2].z, u_xlat0.x, u_xlat7.x);
    u_xlat0.x = u_xlat0.x + VGlobals.hlslcc_mtx4x4unity_MatrixV[3].z;
    output.TEXCOORD3.z = (-u_xlat0.x);
    u_xlat0 = u_xlat2 + VGlobals.hlslcc_mtx4x4unity_MatrixVP[3];
    output.mtl_Position = u_xlat0;
    u_xlat2 = input.COLOR0 + float4(-1.0, -1.0, -1.0, -1.0);
    u_xlat2 = fma(float4(VGlobals.unity_ParticleUseMeshColors), u_xlat2, float4(1.0, 1.0, 1.0, 1.0));
    u_xlatu12 = as_type<uint>(u_xlat5.w) & 0xffu;
    u_xlat3.x = float(u_xlatu12);
    u_xlatu7.xy = bitFieldExtractU(uint2(0x8u, 0x8u), uint2(0x8u, 0x10u), as_type<uint2>(u_xlat5.ww));
    u_xlatu12 = as_type<uint>(u_xlat5.w) >> 0x18u;
    u_xlat3.w = float(u_xlatu12);
    u_xlat3.yz = float2(u_xlatu7.xy);
    u_xlat2 = u_xlat2 * u_xlat3;
    output.COLOR0 = u_xlat2 * float4(0.00392156886, 0.00392156886, 0.00392156886, 0.00392156886);
    u_xlat12 = u_xlat1.x / VGlobals.unity_ParticleUVShiftData.y;
    u_xlat12 = floor(u_xlat12);
    u_xlat1.x = fma((-u_xlat12), VGlobals.unity_ParticleUVShiftData.y, u_xlat1.x);
    u_xlat1.x = floor(u_xlat1.x);
    u_xlat1.x = u_xlat1.x * VGlobals.unity_ParticleUVShiftData.z;
    u_xlat13 = (-VGlobals.unity_ParticleUVShiftData.w) + 1.0;
    u_xlat1.y = fma((-u_xlat12), VGlobals.unity_ParticleUVShiftData.w, u_xlat13);
    u_xlat1.xy = fma(input.TEXCOORD0.xy, VGlobals.unity_ParticleUVShiftData.zw, u_xlat1.xy);
    u_xlatb12 = VGlobals.unity_ParticleUVShiftData.x!=0.0;
    u_xlat1.xy = (bool(u_xlatb12)) ? u_xlat1.xy : input.TEXCOORD0.xy;
    output.TEXCOORD1.xy = fma(u_xlat1.xy, VGlobals._MainTex_ST.xy, VGlobals._MainTex_ST.zw);
    u_xlat0.y = u_xlat0.y * VGlobals._ProjectionParams.x;
    u_xlat1.xzw = u_xlat0.xwy * float3(0.5, 0.5, 0.5);
    output.TEXCOORD3.w = u_xlat0.w;
    output.TEXCOORD3.xy = u_xlat1.zz + u_xlat1.xw;
    return output;
}


-- Fragment shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

//////////////////////////////////////////////////////
Keywords: SOFTPARTICLES_ON _ALPHATEST_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (20 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Cutoff at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float u_xlat3;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    u_xlat3 = fma(u_xlat0.w, input.COLOR0.w, (-FGlobals._Cutoff));
    u_xlat0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat3 + 9.99999975e-05;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: SOFTPARTICLES_ON _ALPHABLEND_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    output.SV_Target0 = u_xlat0 * input.COLOR0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SOFTPARTICLES_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float3 u_xlat0;
    u_xlat0.xyz = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy).xyz;
    u_xlat0.xyz = u_xlat0.xyz * FGlobals._Color.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SOFTPARTICLES_ON _ALPHATEST_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (20 bytes) on slot 0 {
  Vector4 _Color at 0
  Float _Cutoff at 16
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
    float _Cutoff;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    bool u_xlatb0;
    float u_xlat3;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    u_xlat3 = fma(u_xlat0.w, input.COLOR0.w, (-FGlobals._Cutoff));
    u_xlat0.xyz = u_xlat0.xyz * input.COLOR0.xyz;
    output.SV_Target0.xyz = u_xlat0.xyz;
    u_xlat0.x = u_xlat3 + 9.99999975e-05;
    u_xlatb0 = u_xlat0.x<0.0;
    if(((int(u_xlatb0) * int(0xffffffffu)))!=0){discard_fragment();}
    output.SV_Target0.w = 1.0;
    return output;
}


//////////////////////////////////////////////////////
Keywords: PROCEDURAL_INSTANCING_ON SOFTPARTICLES_ON _ALPHABLEND_ON
-- Vertex shader for "metal":
// No shader variant for this keyword set. The closest match will be used instead.

-- Hardware tier variant: Tier 1
-- Fragment shader for "metal":
Set 2D Texture "_MainTex" to slot 0

Constant Buffer "FGlobals" (16 bytes) on slot 0 {
  Vector4 _Color at 0
}

Shader Disassembly:
#include <metal_stdlib>
#include <metal_texture>
using namespace metal;
constant uint32_t rp_output_remap_mask [[ function_constant(1) ]];
constant const uint rp_output_remap_0 = (rp_output_remap_mask >> 0) & 0xF;
struct FGlobals_Type
{
    float4 _Color;
};

struct Mtl_FragmentIn
{
    float4 COLOR0 [[ user(COLOR0) ]] ;
    float2 TEXCOORD1 [[ user(TEXCOORD1) ]] ;
};

struct Mtl_FragmentOut
{
    float4 SV_Target0 [[ color(rp_output_remap_0) ]];
};

fragment Mtl_FragmentOut xlatMtlMain(
    constant FGlobals_Type& FGlobals [[ buffer(0) ]],
    sampler sampler_MainTex [[ sampler (0) ]],
    texture2d<float, access::sample > _MainTex [[ texture(0) ]] ,
    Mtl_FragmentIn input [[ stage_in ]])
{
    Mtl_FragmentOut output;
    float4 u_xlat0;
    u_xlat0 = _MainTex.sample(sampler_MainTex, input.TEXCOORD1.xy);
    u_xlat0 = u_xlat0 * FGlobals._Color;
    output.SV_Target0 = u_xlat0 * input.COLOR0;
    return output;
}


 }
}
CustomEditor "StandardParticlesShaderGUI"
Fallback "VertexLit"
}