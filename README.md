# 🏥 SmartMed NG  
### **AI-Powered Student Health Portal Built on Nigerian Domain Infrastructure**

SmartMed NG is a secure, AI-driven student health portal designed for Nigerian university medical centres. The platform integrates **AI triage**, **functional React frontend**, **local .ng domain infrastructure**, and a future-ready backend design aimed at strengthening data sovereignty in Nigerian educational institutions.

This project was developed for the **NKF NIRA-XT Hackathon II**, aligning with the theme of **Registry Efficiency, Cybersecurity, and Digital Trust**.

---

# 📌 1. Problem Statement

Most university medical centres in Nigeria still operate with:

- Paper-based records  
- Unsecured or foreign-hosted digital platforms  
- No DNS-verified identity  
- Slow patient processing  
- No intelligent triage system  

This results in:

- Data vulnerability  
- Lack of sovereignty and compliance  
- Reduced efficiency  
- Long queues and delayed medical response  

There is a need for a **locally hosted, intelligent, and secure student health system built on the Nigerian DNS ecosystem (.ng)**.

---

# 📌 2. Solution Overview — SmartMed NG

SmartMed NG provides:

### ✔ **A functional, modern React-based student health portal**  
Built and deployed on Vercel, providing clean interfaces for student interactions.

### ✔ **AI-powered triage assistant (Flask ML API)**  
Identifies whether symptoms may be:  
- Mild  
- Moderate  
- Severe  
- Emergency  

Uses a lightweight transformer model (DistilBERT-base).

### ✔ **Fully NiRA-compliant domain integration**  
We purchased **smartmed.ng**, serving as our central registry.

Future structure:
unilag.smartmed.ng
oau.smartmed.ng
buk.smartmed.ng
funaab.smartmed.ng
fuoye.smartmed.ng


### ✔ **Backend + PostgreSQL ready system design**  
Although backend was skipped due to time constraints, the project is structured to support database integration immediately after hackathon.

---

# 📌 3. System Architecture

+-----------------------------+
| React Frontend (Vercel) |
| - Login |
| - Dashboard |
| - Symptoms Triage UI |
| - Student Records UI |
+-------------+---------------+
|
v
+--------------------------------------+
| Flask ML API (Local / Future Cloud) |
| Endpoint: /predict |
| Model: DistilBERT-classifier |
+----------------+---------------------+
|
v
+-----------------------------+
| PostgreSQL (Planned) |
| - Student health logs |
| - Appointments |
| - Predictions |
+-----------------------------+
|
v
+-----------------------------+
| .NG Domain System |
| - smartmed.ng |
| - Verified school domains |
+-----------------------------+


---

# 📌 4. Daily Reflection (As required by hackathon)

### **Day 1 — Understanding the Problem & Planning**
- Analyzed NiRA challenge requirements  
- Defined SmartMed NG concept  
- Created system workflow + domain structure  

### **Day 2 — UI/UX & Frontend Setup**
- Designed Figma UI screens  
- Defined page routing (Login, Dashboard, Symptoms, Records)  
- Set up React project  

### **Day 3 — Frontend Development**
- Implemented full navigation  
- Added Tailwind for styling  
- Built functional forms  

### **Day 4 — Domain & Deployment**
- Purchased `smartmed.ng`  
- Deployed frontend to Vercel  
- Connected DNS settings  

### **Day 5 — ML Model Pipeline**
- Collected symptom dataset  
- Cleaned dataset and applied labeling  
- Fine-tuned DistilBERT-base for triage  
- Created a Flask `/predict` microservice  
- Integrated frontend → ML  

### **Day 6 — Final Integration & Submission**
- Prepared full architecture  
- Compiled documentation  
- Finalized demo flow and screenshots  

---

# 📌 5. Machine Learning Model (Phase 1 Prototype)

### ✔ Model used  
**DistilBERT-base-uncased** (pretrained transformer)  
Fine-tuned on a small, rapid dataset of student medical symptoms.

### ✔ Pipeline  
1. Collect symptoms  
2. Clean & preprocess text  
3. Encode text using DistilBERT  
4. Classify into 4 urgency levels  
5. Return JSON response  

### ✔ Current API (Local)  
http://127.0.0.1:5000/predict


### ✔ Sample Response  
```json
{
  "prediction": "moderate"
}
⚠ Accuracy Note
Due to limited data and time constraints, accuracy is modest.
However, the pipeline works, and the model is fully upgradeable.

