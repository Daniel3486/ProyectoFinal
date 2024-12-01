//ChatGPT + modificaciones
//Original:
//shader_type canvas_item;
//
//uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap; // Acceso a la textura de pantalla
//uniform vec4 color_inversion : hint_color = vec4(1.0, 1.0, 1.0, 1.0); // Controla la intensidad de la inversión
//
//void fragment() {
//    vec4 sprite_color = texture(TEXTURE, UV); // Color del propio sprite
//    if (sprite_color.a == 0.0) {
//        discard; // Descarta las partes transparentes del sprite
//    }
//    
//    vec4 background_color = texture(screen_texture, SCREEN_UV); // Obtenemos el color del fondo usando la textura de pantalla
//    vec3 inverted_color = color_inversion.rgb - background_color.rgb; // Invertimos el color del fondo
//    COLOR = vec4(inverted_color, sprite_color.a); // Aplicamos el color invertido solo en las partes opacas del sprite
//}

shader_type canvas_item;

uniform sampler2D screen_texture : hint_screen_texture, filter_linear_mipmap; // Acceso a la textura de pantalla

void fragment() {
    vec4 sprite_color = texture(TEXTURE, UV); // Color del propio sprite
    if (sprite_color.a == 0.0) {
        discard; // Descarta las partes transparentes del sprite
    }
    
    vec4 background_color = texture(screen_texture, SCREEN_UV); // Obtenemos el color del fondo usando la textura de pantalla
	if (background_color.rgb == vec3(0.0, 0.0, 0.0)){
		vec3 inverted_color = vec3(0.2, 0.2, 0.2);
    	COLOR = vec4(inverted_color, sprite_color.a); // Aplicamos el color invertido solo en las partes opacas del sprite
	}
}
