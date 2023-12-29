using UnityEngine;
using UnityEngine.Rendering;

using System;
using System.IO;
using System.Collections.Generic;


using WriteTxtLog;


namespace Shapes.Samples.Circles
{
	
	public class CircleDebugRenderer : MonoBehaviour {
		
		public Color FillColor;
		public string Path;
		public string TextureChannel0;
		public string TextureChannel1;
		public string TextureChannel2;
		public string TextureChannel3;
		
		[Range(1f, 10f)] public float Radius = 2f;

		private Texture2D TextureToShaderChannel0;
		private Texture2D TextureToShaderChannel1;
		private Texture2D TextureToShaderChannel2;
		private Texture2D TextureToShaderChannel3;
		
		CircleInfo circleToPaint;

		void Start()
		{
			
			TextureToShaderChannel0 = (Texture2D)Resources.Load(TextureChannel0);
			TextureToShaderChannel1 = (Texture2D)Resources.Load(TextureChannel1);
			TextureToShaderChannel2 = (Texture2D)Resources.Load(TextureChannel2);
			TextureToShaderChannel3 = (Texture2D)Resources.Load(TextureChannel3);

			circleToPaint = new CircleInfo
			{
				center = transform.position,
				forward = transform.forward,
				radius = Radius,
				fillColor = FillColor,
				pathShader = Path,
				textureToChannel0 = TextureToShaderChannel0,
				textureToChannel1 = TextureToShaderChannel1,
				textureToChannel2 = TextureToShaderChannel2,
				textureToChannel3 = TextureToShaderChannel3
			};
						
			// if(TextureName.Length != 0)
			// {
				
			// }
			
			Circle.DrawStart(circleToPaint);
			
		}

		 
		private void Update()
		{
			
			Circle.DrawStart(circleToPaint);
		}

		// private void Start()
		// {


		// 	var circleInfo = new CircleInfo
		// 	{
		// 		center = transform.position,
		// 		forward = transform.forward,
		// 		radius = Radius,
		// 		fillColor = FillColor
		// 	};

			
		// 	Circle.Draw(circleInfo);

		// 	Debug.Log(Quaternion.identity);

		// }

		void Awake()
		{
			// WriteTxtLogClass.FunctionWrite();
		}

	}
}
