using UnityEngine;
using UnityEngine.Rendering;

using System;
using System.IO;
using System.Collections.Generic;


using Shapes;


public class ImageTestTexture : MonoBehaviour 
{
	
	public Color FillColor;
	public string Path;
	[Range(1f, 10f)] public float Radius = 2f;
	private Texture2D TextureToShader;


	Renderer materialRender;

	void Start()
	{
	    TextureToShader = (Texture2D)Resources.Load("TwoColor");

	    materialRender = GetComponent<Renderer>();

	}
	 
	private void Update()
	{
		// var circleInfo = new CircleInfo
		// {
		// 	center = transform.position,
		// 	forward = transform.forward,
		// 	radius = Radius,
		// 	fillColor = FillColor,
		// 	pathShader = Path
		// };
		
		
		// Circle.Draw(circleInfo);


		
        if (Input.GetKeyDown(KeyCode.Space))
        {
        	materialRender.material.SetTexture("_MainTex", TextureToShader);
        	// Debug.Log(TextureToShader.format);

	
        }

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

