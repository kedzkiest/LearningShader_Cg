Shader "Holistic/Normal"{
    Properties{
    }
    SubShader{

        CGPROGRAM
            #pragma surface surf Lambert

            struct Input{
                float2 uv_myDiffuse;
            };

            void surf (Input IN, inout SurfaceOutput o){
                o.Albedo = o.Normal;
            }

        ENDCG
    }
    Fallback "Diffuse"
}