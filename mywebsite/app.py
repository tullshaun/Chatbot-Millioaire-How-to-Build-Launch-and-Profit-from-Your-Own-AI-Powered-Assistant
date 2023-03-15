from flask import Flask, request, render_template
from fuzzywuzzy import fuzz

app = Flask(__name__)

# Define the top 10 questions asked by doctors and their answers
doctor_questions = {
    "What are the symptoms of COVID-19?": "The common symptoms of COVID-19 include fever, cough, fatigue, body aches, loss of smell or taste, and shortness of breath. However, some people may experience no symptoms at all.",
    "What is the best way to prevent the spread of COVID-19?": "The best way to prevent the spread of COVID-19 is to get vaccinated, wear a mask, practice social distancing, and wash your hands regularly with soap and water.",
    "What is the treatment for COVID-19?": "The treatment for COVID-19 depends on the severity of the symptoms. Mild cases can be managed with rest, hydration, and over-the-counter medication. Severe cases may require hospitalization and oxygen therapy.",
    "What are the risk factors for heart disease?": "The risk factors for heart disease include high blood pressure, high cholesterol, smoking, diabetes, obesity, and a family history of heart disease.",
    "What is the recommended diet for diabetes?": "The recommended diet for diabetes includes a balance of carbohydrates, protein, and fat. It is important to limit intake of sugary and processed foods, and to focus on whole, nutrient-dense foods.",
    "What are the warning signs of a stroke?": "The warning signs of a stroke include sudden weakness or numbness in the face, arm, or leg, confusion, trouble speaking or understanding speech, and difficulty seeing in one or both eyes.",
    "What is the best way to manage stress?": "The best way to manage stress is to practice relaxation techniques, such as deep breathing, meditation, and yoga. It is also important to exercise regularly, get enough sleep, and maintain a healthy diet.",
    "What are the symptoms of depression?": "The symptoms of depression include persistent feelings of sadness, hopelessness, and worthlessness, loss of interest in activities, changes in appetite or sleep patterns, and difficulty concentrating or making decisions.",
    "What are the risk factors for breast cancer?": "The risk factors for breast cancer include being female, older age, a family history of breast cancer, certain gene mutations, early onset of menstruation or late onset of menopause, and use of hormone replacement therapy.",
    "What are the warning signs of a heart attack?": "The warning signs of a heart attack include chest pain or discomfort, shortness of breath, nausea or vomiting, lightheadedness or fainting, and pain or discomfort in the jaw, neck, or back.",
}

# Define an emergency contact number
emergency_contact = "Call 911 in case of emergency."

# Create a function to process user input and generate chatbot response
def chatbot_response(user_input):
    # Check if the user's input matches one of the top 10 questions asked by doctors
    max_score = 0
    best_question = None
    for question in doctor_questions:
        score = fuzz.token_sort_ratio(user_input.lower(), question.lower())
        if score > max_score:
            max_score = score
            best_question = question
    if max_score > 70:
        return doctor_questions[best_question]
    else:
        return "I'm sorry, I don't understand. Please ask me one of the top 10 questions asked by doctors."

# Create a route for the chatbot interface


@app.route("/", methods=["GET", "POST"])
def chatbot_interface():
    if request.method == "POST":
        user_input = request.form["user_input"]
        response = chatbot_response(user_input)
        return render_template("index.html", response=response)
    else:
        return render_template("index.html")

if __name__ == "__main__":
    app.run(debug=True)
