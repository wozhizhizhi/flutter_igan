class FixUrlUtil{
  static String getFixUrl(String url){
      String fixUrl = url;
      if (fixUrl.startsWith("http")){
        fixUrl.replaceAll("http", "https");
      }
      return fixUrl;
  }

}