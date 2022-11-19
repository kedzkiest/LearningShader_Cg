Shader "Holistic/Wall"{
    Properties{
        _MainTex("Diffuse", 2D) = "white" {}
    }
    SubShader{
        Tags{"Queue" = "Geometry"}

        // if it finds 1, does not draw
        Stencil{
            Ref 1
            Comp notequal
            Pass keep
        }

        CGPROGRAM
        #pragma surface surf Lambert

        sampler2D _MainTex;

        struct Input{
            float2 uv_MainTex;
        };

        void surf (Input IN, inout SurfaceOutput o){
            fixed4 c = tex2D(_MainTex, IN.uv_MainTex);
            o.Albedo = c.rgb;
        }
        ENDCG
    }
    FallBack "Diffuse"
}