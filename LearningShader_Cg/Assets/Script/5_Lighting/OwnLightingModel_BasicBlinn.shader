Shader "Holistic/OwnLightingModel_BasicBlinn"{
    Properties{
        _Color("Color", Color) = (1, 1, 1, 1)
    }
    SubShader{
        Tags{
            "Queue" = "Geometry"
        }

        CGPROGRAM
        #pragma surface surf BasicBlinn

        half4 LightingBasicBlinn(SurfaceOutput s, half3 lightDir, half3 viewDir, half attenuation){
            half3 halfway = normalize(lightDir + viewDir);
            half diffuse = max(0, dot(s.Normal, lightDir));

            float NdotH = max(0, dot(s.Normal, halfway));
            float spec = pow(NdotH, 48.0);

            half4 c;
            c.rgb = (s.Albedo * _LightColor0.rgb * diffuse + _LightColor0.rgb * spec) * attenuation;
            c.a = s.Alpha;
            return c;
        }

        float4 _Color;

        struct Input{
            float2 uv_MainTex;
        };

        void surf(Input IN, inout SurfaceOutput o){
            o.Albedo = _Color.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}