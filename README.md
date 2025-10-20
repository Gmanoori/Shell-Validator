# 🧩 Shell-Validator

**Shell-Validator** is a lightweight framework for **testing and validating Bash/Shell scripts** against predefined test cases.  
It’s built for developers and learners who want to practice shell scripting with automated validation of their solutions.

---

## Features

- Automatically tests user scripts against reference outputs  
- Flexible test-case design — add as many as you want  
- Docker-ready environment for isolated execution  
- Modular structure — easily extend for new problems  
- Perfect for learning, assessments, or code challenges  

---

## 📂 Project Structure
Shell-Validator/
├── userSolution/ # Scripts written by users (your own code)
├── originalSolution/ # Correct reference scripts (for validation)
├── test_cases/ # Input/output test cases
│ ├── input/ # Test input files
│ └── output/ # Expected outputs
├── out/ # Stores generated result logs
├── scr/ # Internal scripts for validation logic
├── test_case.sh # Handles running test cases
├── test.sh # Test your script
├── INIT.sh # Core validator logic
├── Dockerfile # Optional Docker setup for running validation
└── .gitignore


---

## 🧠 How It Works

1. You place your script in `userSolution/`.  
2. The correct version lives in `originalSolution/`.  
3. Test cases (inputs and expected outputs) go under `test_cases/`.  
4. Run `INIT.sh` or `test.sh` to validate your script.  
5. Results appear inside `out/` — showing passed and failed tests.

---

## ⚙️ Installation & Usage

### 🖥️ Option 1 — Run Locally

```bash
git clone https://github.com/Gmanoori/Shell-Validator.git
cd Shell-Validator
chmod +x INIT.sh
./INIT.sh
```

To test your own script:
```bash
./test.sh userSolution/simple.sh
```

### 🖥️ Option 2 — If you prefer isolated testing:
```
docker build -t shell-validator .
docker run -it --rm shell-validator
```

# Run factorial script tests
Usage: 
```bash
./INIT.sh <exercise number> <name of your script>

./INIT.sh 1 userSolution/factorial.sh
```

## Sample output:

✅ Test 1 passed
✅ Test 2 passed
❌ Test 3 failed

## 🤝 Contributing

We welcome contributions! Here's how you can help:

1. Fork this repository
2. Click the Fork button at the top-right corner of this page.
3. Clone your fork locally
  git clone https://github.com/<your-username>/Shell-Validator.git
4. Create a new branch for your feature or fix
  git checkout -b feature/my-enhancement
5. Make your changes, then commit and push
  git add .
  git commit -m "Add my enhancement"
  git push origin feature/my-enhancement
6. Open a Pull Request (PR)
7. Go to your fork → Pull Requests → New Pull Request
Describe your changes clearly.

## 🧱 Contribution Ideas

- Add more example problems and test cases
- Improve validation logic (e.g., diff-based comparison, timeout handling)
- Add color-coded output or summary stats
- Extend to POSIX sh support
- Add support for parallel test execution

## 🧰 Requirements

- Bash 4.0+ (or compatible shell)
- Docker (optional, for isolated testing)
- Linux / macOS preferred (Windows WSL works too)

## 🧑‍💼 Maintainer

**Ganesh Manoori**
If you find this project useful, star ⭐ it to support future development!

## 🌟 License

This project is open-source under the MIT License
.
