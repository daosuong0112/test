//////////////////////////////////////////
//
// NOTE: This is *not* a valid shader file
//
///////////////////////////////////////////
Shader "ASE/Dissolution_BlackOutline" {
Properties {
_EmissionColor ("Emission Color", Color) = (1,1,1,1)
_AlphaCutoff ("Alpha Cutoff ", Range(0, 1)) = 0.5
[ASEBegin] [Enum(Additive,1,AlphaBlend,10)] _BlendAlpha ("Blend Alpha", Float) = 10
[Enum(UnityEngine.Rendering.CullMode)] _Twoside ("Twoside", Float) = 0
[Toggle] _Zwrite ("Zwrite", Float) = 0
[Header(__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)] _MainTexture ("MainTexture", 2D) = "white" { }
[Toggle] _Clamp ("Clamp", Float) = 0
_Color_MainTexture ("Color_MainTexture", Color) = (1,1,1,1)
[Toggle] _UseCustomDataMainTexture ("Use Custom Data(MainTexture 2.xyzw)", Float) = 0
_Color_Back ("Color_Back", Color) = (1,1,1,1)
[Toggle] _BackColor ("BackColor", Float) = 0
_Xspeed_MainTexture ("Xspeed_MainTexture", Float) = 0
_Yspeed_MainTexture ("Yspeed_MainTexture", Float) = 0
[Header(__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)] _MaskTexture ("MaskTexture", 2D) = "white" { }
_Maskntensity ("Maskntensity", Range(1, 10)) = 1
_Xspeed_MaskTexture ("Xspeed_MaskTexture", Float) = 0
_Yspeed_MaskTexture ("Yspeed_MaskTexture", Float) = 0
[Header(__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)] [Toggle] _UseCustomDissolution ("UseCustomDissolution", Float) = 0
_DissolutionTexture ("DissolutionTexture", 2D) = "white" { }
_Xspeed_Dissolution ("Xspeed_Dissolution", Float) = 0
_Yspeed_Dissolution ("Yspeed_Dissolution", Float) = 0
[Toggle] _UseCustomDataDissolutionValue ("Use Custom Data(Dissolution 1.xy)", Float) = 0
_DissolutionValue ("Dissolution Value", Range(0, 1)) = 0
_DissolutionSmooth ("Dissolution Smooth", Range(0, 1)) = 1
_DissolutionOutline ("Dissolution Outline", Range(0, 1)) = 0.05
_DissolutionOutlineColor ("Dissolution Outline Color", Color) = (1,1,1,1)
[Header(__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)] _DissolutionMaskTexture ("DissolutionMaskTexture", 2D) = "white" { }
_DissolutionMaskIntensity ("DissolutionMaskIntensity", Range(0, 1)) = 0.5
_Xspeed_DissolutionMask ("Xspeed_DissolutionMask", Float) = 0
_Yspeed_DissolutionMask ("Yspeed_DissolutionMask", Float) = 0
[Header(__________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________________)] _NoiseTexture ("NoiseTexture", 2D) = "white" { }
_NoiseIntensity ("NoiseIntensity", Range(0, 5)) = 0
_Xspeed_Noise ("Xspeed_Noise", Float) = 0
[ASEEnd] _Yspeed_Noise ("Yspeed_Noise", Float) = 0
}
SubShader {
 Tags { "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
 Pass {
  Name "Forward"
  Tags { "LIGHTMODE" = "UniversalForward" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
  Blend SrcAlpha Zero, SrcAlpha Zero
  ZWrite Off
  Cull Off
  GpuProgramID 44742
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
uniform 	vec4 _Time;
uniform 	vec4 _MainTexture_ST;
uniform 	vec4 _MaskTexture_ST;
uniform 	vec4 _Color_MainTexture;
uniform 	vec4 _Color_Back;
uniform 	vec4 _DissolutionOutlineColor;
uniform 	vec4 _DissolutionTexture_ST;
uniform 	vec4 _DissolutionMaskTexture_ST;
uniform 	vec4 _NoiseTexture_ST;
uniform 	float _Yspeed_DissolutionMask;
uniform 	float _DissolutionMaskIntensity;
uniform 	float _UseCustomDissolution;
uniform 	float _DissolutionValue;
uniform 	float _DissolutionOutline;
uniform 	float _Xspeed_MaskTexture;
uniform 	float _Yspeed_MaskTexture;
uniform 	float _UseCustomDataDissolutionValue;
uniform 	float _Xspeed_DissolutionMask;
uniform 	float _Yspeed_Noise;
uniform 	float _Xspeed_Noise;
uniform 	float _Yspeed_Dissolution;
uniform 	float _Xspeed_Dissolution;
uniform 	float _DissolutionSmooth;
uniform 	float _Clamp;
uniform 	float _Yspeed_MainTexture;
uniform 	float _Xspeed_MainTexture;
uniform 	float _UseCustomDataMainTexture;
uniform 	float _BackColor;
uniform 	float _NoiseIntensity;
uniform 	float _Maskntensity;
uniform lowp sampler2D _MainTexture;
uniform lowp sampler2D _NoiseTexture;
uniform lowp sampler2D _DissolutionTexture;
uniform lowp sampler2D _DissolutionMaskTexture;
uniform lowp sampler2D _MaskTexture;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_TEXCOORD4;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD5;
#define SV_Target0 gl_FragData[0]
vec4 u_xlat0;
lowp float u_xlat10_0;
vec4 u_xlat1;
vec3 u_xlat2;
lowp vec4 u_xlat10_2;
vec4 u_xlat3;
lowp vec4 u_xlat10_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec2 u_xlat6;
lowp float u_xlat10_6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
lowp vec2 u_xlat10_13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat12.x = _Time.y * _Xspeed_DissolutionMask;
    u_xlat0.xy = vs_TEXCOORD3.xy * _DissolutionMaskTexture_ST.xy + _DissolutionMaskTexture_ST.zw;
    u_xlat12.y = _Time.y * _Yspeed_DissolutionMask;
    u_xlat0.xy = u_xlat0.xy + u_xlat12.xy;
    u_xlat10_0 = texture2D(_DissolutionMaskTexture, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD3.xy * _NoiseTexture_ST.xy + _NoiseTexture_ST.zw;
    u_xlat6.xy = _Time.yy * vec2(_Xspeed_Noise, _Yspeed_Noise) + u_xlat6.xy;
    u_xlat10_6 = texture2D(_NoiseTexture, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD3.xy * _DissolutionTexture_ST.xy + _DissolutionTexture_ST.zw;
    u_xlat1.xy = (-u_xlat12.xy) + vec2(u_xlat10_6);
    u_xlat6.xy = vec2(vec2(_NoiseIntensity, _NoiseIntensity)) * u_xlat1.xy + u_xlat12.xy;
    u_xlat1.w = _Time.y * _Yspeed_Dissolution;
    u_xlat1.yz = _Time.yy * vec2(_Yspeed_MainTexture, _Xspeed_Dissolution);
    u_xlat6.xy = u_xlat6.xy + u_xlat1.zw;
    u_xlat10_2 = texture2D(_DissolutionTexture, u_xlat6.xy);
    u_xlat0.x = u_xlat10_0 + (-u_xlat10_2.x);
    u_xlat0.x = _DissolutionMaskIntensity * u_xlat0.x + u_xlat10_2.x;
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDataDissolutionValue);
    u_xlat12.x = (u_xlatb6) ? vs_TEXCOORD5.x : _DissolutionValue;
    u_xlat6.x = (u_xlatb6) ? vs_TEXCOORD5.y : _DissolutionOutline;
    u_xlat12.x = u_xlat12.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x * u_xlat10_2.w + (-u_xlat12.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.y = u_xlat6.x + u_xlat0.x;
    u_xlat12.x = max(_DissolutionSmooth, 0.0);
    u_xlat12.x = min(u_xlat12.x, 0.5);
    u_xlat18 = u_xlat12.x * -2.0 + 1.0;
    u_xlat0.xy = (-u_xlat12.xx) + u_xlat0.xy;
    u_xlat12.x = float(1.0) / u_xlat18;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
    u_xlat12.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat18 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat0.y + (-u_xlat0.x);
    u_xlat6.x = u_xlat0.y * u_xlat12.x;
    u_xlat13.xy = vs_TEXCOORD3.xy * _MaskTexture_ST.xy + _MaskTexture_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_Xspeed_MaskTexture, _Yspeed_MaskTexture) + u_xlat13.xy;
    u_xlat10_13.xy = texture2D(_MaskTexture, u_xlat13.xy).xw;
    u_xlat12.x = u_xlat10_13.y * u_xlat10_13.x;
    u_xlat12.x = u_xlat12.x * _Maskntensity;
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
    u_xlat13.x = u_xlat18 * u_xlat12.x;
    u_xlat13.x = u_xlat13.x * vs_COLOR0.w;
    u_xlat13.x = u_xlat13.x * _DissolutionOutlineColor.w;
    u_xlat3.xy = vs_TEXCOORD3.xy * vs_TEXCOORD4.xy + vs_TEXCOORD4.zw;
    u_xlat15.xy = u_xlat3.xy;
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Clamp);
    u_xlat3.xy = (bool(u_xlatb19)) ? u_xlat15.xy : u_xlat3.xy;
    u_xlat15.xy = vs_TEXCOORD3.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
    u_xlat4.xy = u_xlat15.xy;
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
    u_xlat15.xy = (bool(u_xlatb19)) ? u_xlat4.xy : u_xlat15.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCustomDataMainTexture, _BackColor, _UseCustomDataMainTexture, _UseCustomDataMainTexture)).xy;
    u_xlat3.xy = (u_xlatb4.x) ? u_xlat3.xy : u_xlat15.xy;
    u_xlat1.x = _Time.y * _Xspeed_MainTexture;
    u_xlat1.xy = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy + u_xlat1.xy;
    u_xlat10_3 = texture2D(_MainTexture, u_xlat1.xy);
    u_xlat1.x = u_xlat13.x * u_xlat10_3.w;
    u_xlat7 = u_xlat12.x * u_xlat10_3.w;
    u_xlat7 = u_xlat7 * vs_COLOR0.w;
    u_xlat7 = u_xlat0.x * u_xlat7;
    u_xlat5 = (int((gl_FrontFacing ? 1 : 0)) != 0) ? _Color_MainTexture : _Color_Back;
    u_xlat4 = (u_xlatb4.y) ? u_xlat5 : _Color_MainTexture;
    u_xlat1.x = u_xlat7 * u_xlat4.w + u_xlat1.x;
    u_xlat3 = u_xlat10_3 * u_xlat4;
    u_xlat3 = u_xlat3 * vs_COLOR0;
    u_xlat6.x = u_xlat6.x * u_xlat3.w;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDissolution);
    u_xlat1.w = (u_xlatb12) ? u_xlat6.x : u_xlat1.x;
    u_xlat2.xyz = u_xlat10_2.xyz * vec3(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * _DissolutionOutlineColor.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _DissolutionOutlineColor.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat4.xyz : u_xlat0.xyw;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(1) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_TEXCOORD4;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD5;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD3.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD3.zw = vec2(0.0, 0.0);
    vs_TEXCOORD4 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD5 = in_TEXCOORD1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 _Time;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerMaterial {
#endif
	UNITY_UNIFORM vec4 _MainTexture_ST;
	UNITY_UNIFORM vec4 _MaskTexture_ST;
	UNITY_UNIFORM vec4 _Color_MainTexture;
	UNITY_UNIFORM vec4 _Color_Back;
	UNITY_UNIFORM vec4 _DissolutionOutlineColor;
	UNITY_UNIFORM vec4 _DissolutionTexture_ST;
	UNITY_UNIFORM vec4 _DissolutionMaskTexture_ST;
	UNITY_UNIFORM vec4 _NoiseTexture_ST;
	UNITY_UNIFORM float _Yspeed_DissolutionMask;
	UNITY_UNIFORM float _DissolutionMaskIntensity;
	UNITY_UNIFORM float _UseCustomDissolution;
	UNITY_UNIFORM float _DissolutionValue;
	UNITY_UNIFORM float _DissolutionOutline;
	UNITY_UNIFORM float _Xspeed_MaskTexture;
	UNITY_UNIFORM float _Yspeed_MaskTexture;
	UNITY_UNIFORM float _UseCustomDataDissolutionValue;
	UNITY_UNIFORM float _Xspeed_DissolutionMask;
	UNITY_UNIFORM float _Yspeed_Noise;
	UNITY_UNIFORM float _Xspeed_Noise;
	UNITY_UNIFORM float _Yspeed_Dissolution;
	UNITY_UNIFORM float _Xspeed_Dissolution;
	UNITY_UNIFORM float _DissolutionSmooth;
	UNITY_UNIFORM float _Clamp;
	UNITY_UNIFORM float _Yspeed_MainTexture;
	UNITY_UNIFORM float _Xspeed_MainTexture;
	UNITY_UNIFORM float _UseCustomDataMainTexture;
	UNITY_UNIFORM float _BackColor;
	UNITY_UNIFORM float _NoiseIntensity;
	UNITY_UNIFORM float _Maskntensity;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
UNITY_LOCATION(0) uniform mediump sampler2D _MainTexture;
UNITY_LOCATION(1) uniform mediump sampler2D _NoiseTexture;
UNITY_LOCATION(2) uniform mediump sampler2D _DissolutionTexture;
UNITY_LOCATION(3) uniform mediump sampler2D _DissolutionMaskTexture;
UNITY_LOCATION(4) uniform mediump sampler2D _MaskTexture;
in highp vec4 vs_TEXCOORD3;
in highp vec4 vs_TEXCOORD4;
in highp vec4 vs_COLOR0;
in highp vec4 vs_TEXCOORD5;
layout(location = 0) out mediump vec4 SV_Target0;
vec4 u_xlat0;
mediump float u_xlat16_0;
vec4 u_xlat1;
vec3 u_xlat2;
mediump vec4 u_xlat16_2;
vec4 u_xlat3;
mediump vec4 u_xlat16_3;
vec4 u_xlat4;
bvec2 u_xlatb4;
vec4 u_xlat5;
vec2 u_xlat6;
mediump float u_xlat16_6;
bool u_xlatb6;
float u_xlat7;
vec2 u_xlat12;
bool u_xlatb12;
vec2 u_xlat13;
mediump vec2 u_xlat16_13;
vec2 u_xlat15;
float u_xlat18;
bool u_xlatb19;
void main()
{
    u_xlat12.x = _Time.y * _Xspeed_DissolutionMask;
    u_xlat0.xy = vs_TEXCOORD3.xy * _DissolutionMaskTexture_ST.xy + _DissolutionMaskTexture_ST.zw;
    u_xlat12.y = _Time.y * _Yspeed_DissolutionMask;
    u_xlat0.xy = u_xlat0.xy + u_xlat12.xy;
    u_xlat16_0 = texture(_DissolutionMaskTexture, u_xlat0.xy).x;
    u_xlat6.xy = vs_TEXCOORD3.xy * _NoiseTexture_ST.xy + _NoiseTexture_ST.zw;
    u_xlat6.xy = _Time.yy * vec2(_Xspeed_Noise, _Yspeed_Noise) + u_xlat6.xy;
    u_xlat16_6 = texture(_NoiseTexture, u_xlat6.xy).x;
    u_xlat12.xy = vs_TEXCOORD3.xy * _DissolutionTexture_ST.xy + _DissolutionTexture_ST.zw;
    u_xlat1.xy = (-u_xlat12.xy) + vec2(u_xlat16_6);
    u_xlat6.xy = vec2(vec2(_NoiseIntensity, _NoiseIntensity)) * u_xlat1.xy + u_xlat12.xy;
    u_xlat1.w = _Time.y * _Yspeed_Dissolution;
    u_xlat1.yz = _Time.yy * vec2(_Yspeed_MainTexture, _Xspeed_Dissolution);
    u_xlat6.xy = u_xlat6.xy + u_xlat1.zw;
    u_xlat16_2 = texture(_DissolutionTexture, u_xlat6.xy);
    u_xlat0.x = u_xlat16_0 + (-u_xlat16_2.x);
    u_xlat0.x = _DissolutionMaskIntensity * u_xlat0.x + u_xlat16_2.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb6 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDataDissolutionValue));
#else
    u_xlatb6 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDataDissolutionValue);
#endif
    u_xlat12.x = (u_xlatb6) ? vs_TEXCOORD5.x : _DissolutionValue;
    u_xlat6.x = (u_xlatb6) ? vs_TEXCOORD5.y : _DissolutionOutline;
    u_xlat12.x = u_xlat12.x + u_xlat12.x;
    u_xlat0.x = u_xlat0.x * u_xlat16_2.w + (-u_xlat12.x);
    u_xlat0.x = u_xlat0.x + 1.0;
    u_xlat0.y = u_xlat6.x + u_xlat0.x;
    u_xlat12.x = max(_DissolutionSmooth, 0.0);
    u_xlat12.x = min(u_xlat12.x, 0.5);
    u_xlat18 = u_xlat12.x * -2.0 + 1.0;
    u_xlat0.xy = (-u_xlat12.xx) + u_xlat0.xy;
    u_xlat12.x = float(1.0) / u_xlat18;
    u_xlat0.xy = u_xlat12.xx * u_xlat0.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat0.xy = min(max(u_xlat0.xy, 0.0), 1.0);
#else
    u_xlat0.xy = clamp(u_xlat0.xy, 0.0, 1.0);
#endif
    u_xlat12.x = u_xlat0.y * -2.0 + 3.0;
    u_xlat18 = u_xlat0.x * -2.0 + 3.0;
    u_xlat0.xy = u_xlat0.xy * u_xlat0.xy;
    u_xlat0.x = u_xlat0.x * u_xlat18;
    u_xlat18 = u_xlat12.x * u_xlat0.y + (-u_xlat0.x);
    u_xlat6.x = u_xlat0.y * u_xlat12.x;
    u_xlat13.xy = vs_TEXCOORD3.xy * _MaskTexture_ST.xy + _MaskTexture_ST.zw;
    u_xlat13.xy = _Time.yy * vec2(_Xspeed_MaskTexture, _Yspeed_MaskTexture) + u_xlat13.xy;
    u_xlat16_13.xy = texture(_MaskTexture, u_xlat13.xy).xw;
    u_xlat12.x = u_xlat16_13.y * u_xlat16_13.x;
    u_xlat12.x = u_xlat12.x * _Maskntensity;
#ifdef UNITY_ADRENO_ES3
    u_xlat12.x = min(max(u_xlat12.x, 0.0), 1.0);
#else
    u_xlat12.x = clamp(u_xlat12.x, 0.0, 1.0);
#endif
    u_xlat13.x = u_xlat18 * u_xlat12.x;
    u_xlat13.x = u_xlat13.x * vs_COLOR0.w;
    u_xlat13.x = u_xlat13.x * _DissolutionOutlineColor.w;
    u_xlat3.xy = vs_TEXCOORD3.xy * vs_TEXCOORD4.xy + vs_TEXCOORD4.zw;
    u_xlat15.xy = u_xlat3.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat15.xy = min(max(u_xlat15.xy, 0.0), 1.0);
#else
    u_xlat15.xy = clamp(u_xlat15.xy, 0.0, 1.0);
#endif
#ifdef UNITY_ADRENO_ES3
    u_xlatb19 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Clamp));
#else
    u_xlatb19 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_Clamp);
#endif
    u_xlat3.xy = (bool(u_xlatb19)) ? u_xlat15.xy : u_xlat3.xy;
    u_xlat15.xy = vs_TEXCOORD3.xy * _MainTexture_ST.xy + _MainTexture_ST.zw;
    u_xlat4.xy = u_xlat15.xy;
#ifdef UNITY_ADRENO_ES3
    u_xlat4.xy = min(max(u_xlat4.xy, 0.0), 1.0);
#else
    u_xlat4.xy = clamp(u_xlat4.xy, 0.0, 1.0);
#endif
    u_xlat15.xy = (bool(u_xlatb19)) ? u_xlat4.xy : u_xlat15.xy;
    u_xlatb4.xy = notEqual(vec4(0.0, 0.0, 0.0, 0.0), vec4(_UseCustomDataMainTexture, _BackColor, _UseCustomDataMainTexture, _UseCustomDataMainTexture)).xy;
    u_xlat3.xy = (u_xlatb4.x) ? u_xlat3.xy : u_xlat15.xy;
    u_xlat1.x = _Time.y * _Xspeed_MainTexture;
    u_xlat1.xy = (u_xlatb4.x) ? vec2(0.0, 0.0) : u_xlat1.xy;
    u_xlat1.xy = u_xlat3.xy + u_xlat1.xy;
    u_xlat16_3 = texture(_MainTexture, u_xlat1.xy);
    u_xlat1.x = u_xlat13.x * u_xlat16_3.w;
    u_xlat7 = u_xlat12.x * u_xlat16_3.w;
    u_xlat7 = u_xlat7 * vs_COLOR0.w;
    u_xlat7 = u_xlat0.x * u_xlat7;
    u_xlat5 = (uint((gl_FrontFacing ? 0xffffffffu : uint(0))) != uint(0)) ? _Color_MainTexture : _Color_Back;
    u_xlat4 = (u_xlatb4.y) ? u_xlat5 : _Color_MainTexture;
    u_xlat1.x = u_xlat7 * u_xlat4.w + u_xlat1.x;
    u_xlat3 = u_xlat16_3 * u_xlat4;
    u_xlat3 = u_xlat3 * vs_COLOR0;
    u_xlat6.x = u_xlat6.x * u_xlat3.w;
    u_xlat6.x = u_xlat12.x * u_xlat6.x;
#ifdef UNITY_ADRENO_ES3
    u_xlatb12 = !!(vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDissolution));
#else
    u_xlatb12 = vec4(0.0, 0.0, 0.0, 0.0)!=vec4(_UseCustomDissolution);
#endif
    u_xlat1.w = (u_xlatb12) ? u_xlat6.x : u_xlat1.x;
    u_xlat2.xyz = u_xlat16_2.xyz * vec3(u_xlat18);
    u_xlat4.xyz = vec3(u_xlat18) * _DissolutionOutlineColor.xyz + u_xlat3.xyz;
    u_xlat2.xyz = u_xlat2.xyz * _DissolutionOutlineColor.xyz;
    u_xlat0.xyw = u_xlat3.xyz * u_xlat0.xxx + u_xlat2.xyz;
    u_xlat1.xyz = (bool(u_xlatb12)) ? u_xlat4.xyz : u_xlat0.xyw;
    SV_Target0 = u_xlat1;
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles " {
""
}
SubProgram "gles3 " {
""
}
}
}
 Pass {
  Name "DepthOnly"
  Tags { "LIGHTMODE" = "DepthOnly" "QUEUE" = "Transparent" "RenderPipeline" = "UniversalPipeline" "RenderType" = "Transparent" }
  ColorMask 0 0
  Cull Off
  GpuProgramID 158106
Program "vp" {
SubProgram "gles " {
"#ifdef VERTEX
#version 100

uniform 	vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
attribute highp vec4 in_POSITION0;
attribute highp vec4 in_TEXCOORD0;
attribute highp vec4 in_TEXCOORD2;
attribute highp vec4 in_COLOR0;
attribute highp vec4 in_TEXCOORD1;
varying highp vec4 vs_TEXCOORD2;
varying highp vec4 vs_TEXCOORD3;
varying highp vec4 vs_COLOR0;
varying highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4 = in_TEXCOORD1;
    return;
}

#endif
#ifdef FRAGMENT
#version 100

#ifdef GL_FRAGMENT_PRECISION_HIGH
    precision highp float;
#else
    precision mediump float;
#endif
precision highp int;
#define SV_TARGET0 gl_FragData[0]
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
SubProgram "gles3 " {
"#ifdef VERTEX
#version 300 es

#define HLSLCC_ENABLE_UNIFORM_BUFFERS 1
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
#define UNITY_UNIFORM
#else
#define UNITY_UNIFORM uniform
#endif
#define UNITY_SUPPORTS_UNIFORM_LOCATION 1
#if UNITY_SUPPORTS_UNIFORM_LOCATION
#define UNITY_LOCATION(x) layout(location = x)
#define UNITY_BINDING(x) layout(binding = x, std140)
#else
#define UNITY_LOCATION(x)
#define UNITY_BINDING(x) layout(std140)
#endif
uniform 	vec4 hlslcc_mtx4x4unity_MatrixVP[4];
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
UNITY_BINDING(0) uniform UnityPerDraw {
#endif
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_ObjectToWorld[4];
	UNITY_UNIFORM vec4 hlslcc_mtx4x4unity_WorldToObject[4];
	UNITY_UNIFORM vec4 unity_LODFade;
	UNITY_UNIFORM mediump vec4 unity_WorldTransformParams;
	UNITY_UNIFORM mediump vec4 unity_LightData;
	UNITY_UNIFORM mediump vec4 unity_LightIndices[2];
	UNITY_UNIFORM vec4 unity_ProbesOcclusion;
	UNITY_UNIFORM mediump vec4 unity_SpecCube0_HDR;
	UNITY_UNIFORM vec4 unity_LightmapST;
	UNITY_UNIFORM vec4 unity_DynamicLightmapST;
	UNITY_UNIFORM mediump vec4 unity_SHAr;
	UNITY_UNIFORM mediump vec4 unity_SHAg;
	UNITY_UNIFORM mediump vec4 unity_SHAb;
	UNITY_UNIFORM mediump vec4 unity_SHBr;
	UNITY_UNIFORM mediump vec4 unity_SHBg;
	UNITY_UNIFORM mediump vec4 unity_SHBb;
	UNITY_UNIFORM mediump vec4 unity_SHC;
#if HLSLCC_ENABLE_UNIFORM_BUFFERS
};
#endif
in highp vec4 in_POSITION0;
in highp vec4 in_TEXCOORD0;
in highp vec4 in_TEXCOORD2;
in highp vec4 in_COLOR0;
in highp vec4 in_TEXCOORD1;
out highp vec4 vs_TEXCOORD2;
out highp vec4 vs_TEXCOORD3;
out highp vec4 vs_COLOR0;
out highp vec4 vs_TEXCOORD4;
vec4 u_xlat0;
vec4 u_xlat1;
void main()
{
    u_xlat0.xyz = in_POSITION0.yyy * hlslcc_mtx4x4unity_ObjectToWorld[1].xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[0].xyz * in_POSITION0.xxx + u_xlat0.xyz;
    u_xlat0.xyz = hlslcc_mtx4x4unity_ObjectToWorld[2].xyz * in_POSITION0.zzz + u_xlat0.xyz;
    u_xlat0.xyz = u_xlat0.xyz + hlslcc_mtx4x4unity_ObjectToWorld[3].xyz;
    u_xlat1 = u_xlat0.yyyy * hlslcc_mtx4x4unity_MatrixVP[1];
    u_xlat1 = hlslcc_mtx4x4unity_MatrixVP[0] * u_xlat0.xxxx + u_xlat1;
    u_xlat0 = hlslcc_mtx4x4unity_MatrixVP[2] * u_xlat0.zzzz + u_xlat1;
    gl_Position = u_xlat0 + hlslcc_mtx4x4unity_MatrixVP[3];
    vs_TEXCOORD2.xy = in_TEXCOORD0.xy;
    vs_TEXCOORD2.zw = vec2(0.0, 0.0);
    vs_TEXCOORD3 = in_TEXCOORD2;
    vs_COLOR0 = in_COLOR0;
    vs_TEXCOORD4 = in_TEXCOORD1;
    return;
}

#endif
#ifdef FRAGMENT
#version 300 es

precision highp float;
precision highp int;
layout(location = 0) out mediump vec4 SV_TARGET0;
void main()
{
    SV_TARGET0 = vec4(0.0, 0.0, 0.0, 0.0);
    return;
}

#endif
"
}
}
Program "fp" {
SubProgram "gles " {
""
}
SubProgram "gles3 " {
""
}
}
}
}
Fallback "Hidden/InternalErrorShader"
CustomEditor "UnityEditor.ShaderGraph.PBRMasterGUI"
}