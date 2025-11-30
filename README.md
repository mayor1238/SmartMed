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
We purchased **smart-med.name.ng**, serving as our central registry.

Future structure:
unilag.smart-med.name.ng
oau.smart-med.name.ng
buk.smart-med.name.ng
funaab.smart-med.name.ng
fuoye.smart-med.name.ng


### ✔ **Backend + PostgreSQL ready system design**  
Although backend was skipped due to time constraints, the project is structured to support database integration immediately after hackathon.

---

# 📌 3. System Architecture

# SmartMed.ng - AI-Powered School Health Management System

An intelligent health triage and management platform designed for Nigerian schools, combining machine learning diagnostics with comprehensive student health records management.

## 🏗️ System Architecture
```
+-----------------------------+
|   React Frontend (Vercel)   |
|   - Login & Authentication  |
|   - Dashboard               |
|   - Symptoms Triage UI      |
|   - Student Records UI      |
+-------------+---------------+
              |
              v
+--------------------------------------+
|  Flask ML API (Local / Future Cloud) |
|  Endpoint: /predict                  |
|  Model: DistilBERT-classifier        |
+----------------+---------------------+
                 |
                 v
+-----------------------------+
|     PostgreSQL (Planned)    |
|  - Student health logs      |
|  - Appointments             |
|  - Predictions              |
+-----------------------------+
              |
              v
+-----------------------------+
|    .NG Domain System        |
|    - smartmed.ng            |
|    - Verified school domains|
+-----------------------------+
```

## ✨ Features

- **AI-Powered Symptom Triage**: DistilBERT-based classifier for preliminary health assessment
- **Student Health Records**: Comprehensive digital health record management
- **Dashboard Analytics**: Real-time health metrics and trends
- **Secure Authentication**: Role-based access control for school staff
- **Nigerian Context**: Designed specifically for Nigerian school healthcare needs

## 🗺️ Roadmap

- [x] Frontend UI/UX Design
- [x] ML Model Development (DistilBERT)
- [x] Basic Flask API
- [ ] PostgreSQL Integration
- [ ] User Authentication & Authorization
- [ ] Cloud Deployment
- [ ] School Domain Verification System
- [ ] Mobile App (Flutter/React Native)
- [ ] Telemedicine Integration

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
- Purchased `smart-med.name.ng`  
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

{
  "prediction": "moderate"
}
⚠ Accuracy Note
Due to limited data and time constraints, accuracy is modest.
However, the pipeline works, and the model is fully upgradeable.

📌 6. Future Integrations (Phase 2 & 3)
SmartMed NG is designed for scalability. After the hackathon, we will implement:

🌱 1. Improved ML Model
Larger dataset from universities

Model retraining using clinical notes

Migration to cloud inference (HF, Vercel AI, Render)

Advanced models like DeBERTa-v3-small or ClinicalBERT

🧱 2. Full Backend Integration
FastAPI backend with JWT auth

Protected API gateway

Role-based access control (students, nurses, admin)

🗄️ 3. PostgreSQL Database
Storing:

Health logs

Predictions

Appointment history

Medical follow-ups

Security features:

AES encryption

VPN/SSL

Local data sovereignty (Nigeria-hosted)
🌐 4. Domain Deployment for Schools
Each school gets:

Copy code
schoolName.smart-med.name.ng
With:
TLS

SSL

NiRA verified registry


Although DNSSEC is now officially supported by NiRA for the .ng namespace (as announced in 2024–2025), our registrar / DNS hosting provider (WhoGoHost) does not yet offer DNSSEC configuration or DS-record publishing for third-level domains such as .name.ng. We made an intentional decision to preserve stability and correct DNS resolution rather than risk breakage with a partial or unsupported DNSSEC setup.

We believe that the submission of SmartMed NG — a fully functional, security-aware application built on a .ng domain — helps highlight the need for widespread DNSSEC adoption across registrars. With more live .ng projects like ours, registrars and NiRA are more likely to enable and support DNSSEC for end-users, making the entire .ng ecosystem safer and more trustworthy.



📱 5. Mobile App & USSD fallback
To reach students without smartphones.

💡 6. ML Feedback System
Triage accuracy improves automatically as clinic staff confirm cases.

📌 7. How to Run the ML API Locally
bash
Copy code
cd ml-service
python -m venv venv
source venv/bin/activate     # or venv\Scripts\activate (Windows)
pip install -r requirements.txt
python app.py
Runs at:

arduino
Copy code
http://127.0.0.1:5000/predict
📌 8. How to Run the Frontend
bash
Copy code
cd frontend
npm install
npm run dev
Vercel Build Settings:

Build: npm run build

Output: dist

📌 9. Deployment Links
Live Demo:
smart-med.name.ng






