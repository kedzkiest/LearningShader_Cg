Shader "Holistic/Challenge2_4"{

    Properties{
        _myTex ("Diffuse Texture", 2D) = "white" {}
        _myTex2 ("Emissive Texture", 2D) = "black" {}
    }

    SubShader{

        CGPROGRAM
            #pragma surface surf Lambert

            sampler2D _myTex;
            sampler2D _myTex2;

            struct Input{
                float2 uv_myTex;
                float2 uv_myTex2;
            };

            void surf (Input IN, inout SurfaceOutput o){
                o.Albedo.rgb = tex2D(_myTex, IN.uv_myTex).rgb;
                o.Emission = tex2D(_myTex2, IN.uv_myTex2).rgb;
            }

        ENDCG
    }

    FallBack "Diffuse"
}