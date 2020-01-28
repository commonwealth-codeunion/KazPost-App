import 'package:kazpost/app/pages/quiz/quiz_model.dart';

class QuizBloc {
  Stream<List> get getQuiz async* {
    yield await QuizModel.getQuiz();
  }
}
