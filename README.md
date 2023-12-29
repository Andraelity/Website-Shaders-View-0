# UnityShapes
GPU-instance-supported, 0 allocation shapes (circle) with one line of code in Unity

![](UnityShader.gif)


Couldn't´t be simpler:

```c#
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
```




```c#

	static Material GetMaterialStart(CircleInfo circleInfo)
	{
		
		string pathShader = circleInfo.pathShader;
		var mat = new Material(Shader.Find(pathShader));
		// var mat = new Material(Shader.Find("Hidden/Shapes/Circle"));
	
		if (SystemInfo.supportsInstancing)
		{
			mat.enableInstancing = true;
		}
		mat.SetTexture("_TextureChannel0", circleInfo.textureToChannel0);
		mat.SetTexture("_TextureChannel1", circleInfo.textureToChannel1);
		mat.SetTexture("_TextureChannel2", circleInfo.textureToChannel2);
		mat.SetTexture("_TextureChannel3", circleInfo.textureToChannel3);
		_material = mat;
		return mat;
	}
```

