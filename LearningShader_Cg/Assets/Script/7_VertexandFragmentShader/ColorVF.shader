Shader "Holistic/ColorVF"
{
    SubShader
    {
        Pass
        {
            CGPROGRAM
            #pragma vertex vert
            #pragma fragment frag

            #include "UnityCG.cginc"

            struct appdata
            {
                float4 vertex : POSITION;
            };

            struct v2f
            {
                float4 vertex : SV_POSITION;
                float4 color: COLOR;
            };

            // runs on every vertex
            v2f vert (appdata v)
            {
                v2f o;
                o.vertex = UnityObjectToClipPos(v.vertex);
                o.color.r = (v.vertex.x + 5)/10;
                o.color.g = (v.vertex.z + 5)/10;
                return o;
            }

            // runs on every pixel
            fixed4 frag (v2f i) : SV_Target
            {
                // fixed col;
                fixed4 col = i.color;
                // we have to write color manipulation here like below
                // since i is a transformed value for screen space from original vertices (world space),
                //col.r = i.vertex.x / 1000;
                //col.g = i.vertex.y / 1000;
                return col;
            }
            ENDCG
        }
    }
}
