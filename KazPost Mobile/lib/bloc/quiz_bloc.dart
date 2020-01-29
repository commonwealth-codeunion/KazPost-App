

import 'package:kazpost/models/quiz_model.dart';

class QuizBloc {
  Stream<List> get getQuiz async* {
    yield await QuizModel.getQuiz();
  }
}
