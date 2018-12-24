package org.ehk0429.service;

public interface TranslationService {
	
//	translatedText	string	번역문장
	public String getTranslatedText(String text, String source, String target);
}
