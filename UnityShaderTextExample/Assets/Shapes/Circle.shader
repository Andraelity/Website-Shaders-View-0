Shader "Hidden/Shapes/Circle"
{
	Properties
	{
		_TextureChannel0 ("Texture", 2D) = "gray" {}
		_TextureChannel1 ("Texture", 2D) = "gray" {}
		_TextureChannel2 ("Texture", 2D) = "gray" {}
		_TextureChannel3 ("Texture", 2D) = "gray" {}


	}
	SubShader
	{
		Tags { "RenderType"="Transparent" "Queue" = "Transparent" "DisableBatching" ="true" }
		LOD 100

		Pass
		{
		    ZWrite Off
		    Cull off
		    Blend SrcAlpha OneMinusSrcAlpha
		    
			CGPROGRAM
			#pragma vertex vert
			#pragma fragment frag
			
            #pragma multi_compile_instancing
			
			#include "UnityCG.cginc"

			struct vertexPoints
			{
				float4 vertex : POSITION;
				float2 uv : TEXCOORD0;
                UNITY_VERTEX_INPUT_INSTANCE_ID
			};

			struct pixel
			{
				float2 uv : TEXCOORD0;
				float4 vertex : SV_POSITION;
				UNITY_VERTEX_INPUT_INSTANCE_ID
			};

            UNITY_INSTANCING_BUFFER_START(CommonProps)
                UNITY_DEFINE_INSTANCED_PROP(fixed4, _FillColor)
                UNITY_DEFINE_INSTANCED_PROP(float, _AASmoothing)
                // UNITY_DEFINE_INSTANCED_PROP(sampler2D, _TextureFocus)
            UNITY_INSTANCING_BUFFER_END(CommonProps)

            
            sampler2D _TextureChannel0;
            sampler2D _TextureChannel1;
            sampler2D _TextureChannel2;
            sampler2D _TextureChannel3;
            

			pixel vert (vertexPoints v)
			{
				pixel o;
				
				UNITY_SETUP_INSTANCE_ID(v);
				UNITY_TRANSFER_INSTANCE_ID(v, o);
				
				o.vertex = UnityObjectToClipPos(v.vertex);
				o.uv = v.vertex.xy;
				return o;
			}
			
			fixed4 frag (pixel i) : SV_Target
			{
			
			    UNITY_SETUP_INSTANCE_ID(i);
			    
			    float aaSmoothing = UNITY_ACCESS_INSTANCED_PROP(CommonProps, _AASmoothing);
			    fixed4 fillColor = UNITY_ACCESS_INSTANCED_PROP(CommonProps, _FillColor);
			    // sampler2D textureToPaint = UNITY_ACCESS_INSTANCED_PROP(CommonProps, _TextureFocus);

			    // float distanceToCenter = length(i.uv);
                fixed4 col = tex2D(_TextureChannel0, i.uv);
					
				
				
				if ( i.uv.x < 0.5 && i.uv.x > -0.5 && i.uv.y < 0.5 && i.uv.y > -0.5)
				{
					// return float4(1,0,0,1);
					return col;
				}
	
				return float4(0,1,0,1) ;		
				// col = fixed4(i.uv.x, i.uv.y,0,1);	
					
				
				// *******this block of code works as a whole *****************			    
			    // float distancePerPixel = fwidth(distanceToCenter);
			    // float distanceAlphaFactor = 1.0 - smoothstep(1.0-distancePerPixel*aaSmoothing,1.0,distanceToCenter);
			    // float halfSmoothFactor = 0.5f * distancePerPixel * aaSmoothing;
			    

			    
			    // fixed4 circleColor = fillColor;
			    // circleColor.a *= distanceAlphaFactor;
			    
			    
                // return circleColor;
				// ******* Uncomment it if you want to make it work *****************			    


			    /*
				if(distanceToCenter < 0.5)
			    {
			    	return fixed4(1,1,0,1);
			    }
			    else
			    {
			    	return fixed4(0,0,0,1);
			    }
                return float4(distanceToCenter, 0,0,1);
				*/
			}
			ENDCG
		}
	}
}
