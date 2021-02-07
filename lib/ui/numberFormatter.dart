class NumberFormatter{

  static String formatter(int count) {
    try{
      if(count == null){
        return '      -    ';
      }else if(count < 1000000){
        var result = count/1000;// less than a million
        return result.toStringAsFixed(2)+'K';
      }else if(count >= 1000000 && count < (1000000*10*100)){ // less than 100 million
        var result = count/1000000;
        return result.toStringAsFixed(2)+"M";
      }else if(count >= (1000000*10*100) && count < (1000000*10*100*100)){ // less than 100 billion
        var result = count/(1000000*10*100);
        return result.toStringAsFixed(2)+"B";
      }else if(count >= (1000000*10*100*100) && count < (1000000*10*100*100*100)){ // less than 100 trillion
        var result = count/(1000000*10*100*100);
        return result.toStringAsFixed(2)+"T";
      }
    }catch(e){
      print(e);
    }
  }

  static String commaFormatter(int count){
    if(count == null){
      return ' - ';
    }
    RegExp reg = new RegExp(r'(\d{1,3})(?=(\d{3})+(?!\d))');
    Function mathFunc = (Match match) => '${match[1]},';

    String result = count.toString().replaceAllMapped(reg, mathFunc);
    return result;
  }
}