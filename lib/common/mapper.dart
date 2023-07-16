abstract class Mapper<IN, OUT> {
  OUT map(IN model);
  IN inverseMap(OUT model);

  List<OUT> mapList(List<IN> values) => values.map((e) => map(e)).toList();
  List<IN> inverseMapList(List<OUT> values)  => values.map((e) => inverseMap(e)).toList();
}
