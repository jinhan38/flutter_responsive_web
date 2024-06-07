import 'package:flutter/material.dart';
import 'package:flutter_responsive_web/util/my_validation.dart';

class QuestionUtil {
  static final QuestionUtil _singleton = QuestionUtil._();

  factory QuestionUtil() => _singleton;

  QuestionUtil._();

  var titleController = TextEditingController();
  var nameController = TextEditingController();
  var emailController = TextEditingController();
  var contentController = TextEditingController();

  int questionTypeIndex = 0;
  int questionPriceIndex = 0;

  void changeQuestionType(int index) => questionTypeIndex = index;

  void changeQuestionPrice(int index) => questionPriceIndex = index;

  void initData() {
    titleController = TextEditingController();
    nameController = TextEditingController();
    emailController = TextEditingController();
    contentController = TextEditingController();
    questionTypeIndex = 0;
  }

  void clear() {
    titleController.text = "";
    nameController.text = "";
    emailController.text = "";
    contentController.text = "";
    questionTypeIndex = 0;
  }

  void dispose() {
    titleController.dispose();
    nameController.dispose();
    emailController.dispose();
    contentController.dispose();
  }

  bool checkValidation() {
    if (!MyValidation.isEmail(emailController.text)) return false;
    if (!MyValidation.questionTitle(titleController.text)) return false;
    if (!MyValidation.questionName(nameController.text)) return false;
    if (!MyValidation.questionContent(contentController.text)) return false;
    return true;
  }
}
