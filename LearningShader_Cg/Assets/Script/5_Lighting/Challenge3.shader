Shader "Holistic/Challenge5_35"{
    Properties{
        _Color ("Color", Color) = (1, 1, 1, 1)
        _RampTex("Ramp Texture", 2D) = "white" {}
    }

    SubShader{

        CGPROGRAM
        #pragma surface surf ToonRamp
        sampler2D _RampTex;

        float4 LightingToonRamp(SurfaceOutput s, fixed3 lightDir, fixed attenuation){
            float diffuse = dot(s.Normal, lightDir);

            // the UV value (diffuse[-1 ~ 1] -> h[0 ~ 1])
            float h = diffuse * 0.5 + 0.5;
            float2 rh = h;
            float3 ramp = tex2D(_RampTex, rh).rgb;

            float4 c;
            c.rgb = _LightColor0.rgb * ramp;
            c.a = s.Alpha;
            return c;
        }

        struct Input{
            float2 uv_MainTex;
            float3 viewDir;
        };

        void surf(Input IN, inout SurfaceOutput o){
            float diff = dot(o.Normal, IN.viewDir);
            float h = diff * 0.5 + 0.5;
            float2 rh = h;
            o.Albedo = tex2D(_RampTex, rh).rgb;
        }

        ENDCG
    }
    Fallback "Diffuse"
}