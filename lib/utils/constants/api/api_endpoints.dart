class ApiEndPoints{
  ApiEndPoints._();

  static String autocomplete({required String apiKey, required String query, String? city, bool? bangla}) => 'search/autocomplete/place?api_key=$apiKey&q=$query&city=${city??''}&bangla=${bangla??''}';
}