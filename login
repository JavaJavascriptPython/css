<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Welcome Back</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        body {
            font-family: -apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, Oxygen, Ubuntu, Cantarell, sans-serif;
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
            overflow-x: hidden;
            transition: all 0.5s ease;
        }

        /* Day theme */
        body.day {
            background: 
                radial-gradient(circle at 20% 20%, rgba(255, 248, 220, 0.4) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(255, 239, 213, 0.5) 0%, transparent 50%),
                radial-gradient(circle at 40% 60%, rgba(254, 215, 170, 0.3) 0%, transparent 50%),
                linear-gradient(135deg, #fef7cd 0%, #fed7aa 25%, #fb923c 50%, #ea580c 75%, #c2410c 100%);
        }

        /* Night theme */
        body.night {
            background: 
                radial-gradient(circle at 20% 20%, rgba(30, 41, 59, 0.6) 0%, transparent 50%),
                radial-gradient(circle at 80% 80%, rgba(51, 65, 85, 0.5) 0%, transparent 50%),
                radial-gradient(circle at 40% 60%, rgba(71, 85, 105, 0.4) 0%, transparent 50%),
                linear-gradient(135deg, #0f172a 0%, #1e293b 25%, #334155 50%, #475569 75%, #64748b 100%);
        }

        .background-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        .background-shapes {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            pointer-events: none;
            z-index: 0;
        }

        /* Sun for day theme */
        .sun {
            position: absolute;
            width: 120px;
            height: 120px;
            top: 10%;
            right: 15%;
            background: radial-gradient(circle, #fbbf24 0%, #f59e0b 50%, #d97706 100%);
            border-radius: 50%;
            box-shadow: 
                0 0 60px rgba(251, 191, 36, 0.4),
                0 0 120px rgba(245, 158, 11, 0.2);
            animation: sunGlow 4s ease-in-out infinite alternate;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        body.day .sun {
            opacity: 1;
        }

        @keyframes sunGlow {
            0% { 
                transform: scale(1);
                box-shadow: 
                    0 0 60px rgba(251, 191, 36, 0.4),
                    0 0 120px rgba(245, 158, 11, 0.2);
            }
            100% { 
                transform: scale(1.1);
                box-shadow: 
                    0 0 80px rgba(251, 191, 36, 0.6),
                    0 0 160px rgba(245, 158, 11, 0.3);
            }
        }

        /* Sun rays */
        .sun::before {
            content: '';
            position: absolute;
            top: -40px;
            left: -40px;
            right: -40px;
            bottom: -40px;
            background: 
                conic-gradient(from 0deg, transparent 0deg, rgba(251, 191, 36, 0.1) 10deg, transparent 20deg,
                              transparent 45deg, rgba(251, 191, 36, 0.1) 55deg, transparent 65deg,
                              transparent 90deg, rgba(251, 191, 36, 0.1) 100deg, transparent 110deg,
                              transparent 135deg, rgba(251, 191, 36, 0.1) 145deg, transparent 155deg,
                              transparent 180deg, rgba(251, 191, 36, 0.1) 190deg, transparent 200deg,
                              transparent 225deg, rgba(251, 191, 36, 0.1) 235deg, transparent 245deg,
                              transparent 270deg, rgba(251, 191, 36, 0.1) 280deg, transparent 290deg,
                              transparent 315deg, rgba(251, 191, 36, 0.1) 325deg, transparent 335deg);
            border-radius: 50%;
            animation: sunRays 20s linear infinite;
        }

        @keyframes sunRays {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        /* Stars for night theme */
        .stars {
            position: absolute;
            width: 100%;
            height: 100%;
            opacity: 0;
            transition: opacity 0.5s ease;
        }

        body.night .stars {
            opacity: 1;
        }

        .star {
            position: absolute;
            background: white;
            border-radius: 50%;
            animation: twinkle 3s ease-in-out infinite;
        }

        .star:nth-child(1) { width: 2px; height: 2px; top: 10%; left: 10%; animation-delay: 0s; }
        .star:nth-child(2) { width: 3px; height: 3px; top: 15%; left: 80%; animation-delay: 0.5s; }
        .star:nth-child(3) { width: 1px; height: 1px; top: 25%; left: 60%; animation-delay: 1s; }
        .star:nth-child(4) { width: 2px; height: 2px; top: 35%; left: 20%; animation-delay: 1.5s; }
        .star:nth-child(5) { width: 3px; height: 3px; top: 45%; left: 90%; animation-delay: 2s; }
        .star:nth-child(6) { width: 1px; height: 1px; top: 55%; left: 40%; animation-delay: 0.3s; }
        .star:nth-child(7) { width: 2px; height: 2px; top: 65%; left: 70%; animation-delay: 0.8s; }
        .star:nth-child(8) { width: 1px; height: 1px; top: 75%; left: 15%; animation-delay: 1.3s; }
        .star:nth-child(9) { width: 3px; height: 3px; top: 85%; left: 85%; animation-delay: 1.8s; }
        .star:nth-child(10) { width: 2px; height: 2px; top: 20%; left: 45%; animation-delay: 2.3s; }
        .star:nth-child(11) { width: 1px; height: 1px; top: 30%; left: 75%; animation-delay: 0.6s; }
        .star:nth-child(12) { width: 2px; height: 2px; top: 40%; left: 5%; animation-delay: 1.1s; }
        .star:nth-child(13) { width: 1px; height: 1px; top: 50%; left: 95%; animation-delay: 1.6s; }
        .star:nth-child(14) { width: 3px; height: 3px; top: 60%; left: 25%; animation-delay: 2.1s; }
        .star:nth-child(15) { width: 2px; height: 2px; top: 70%; left: 55%; animation-delay: 0.4s; }

        @keyframes twinkle {
            0%, 100% { opacity: 0.3; transform: scale(1); }
            50% { opacity: 1; transform: scale(1.2); }
        }

        /* Moon for night theme */
        .moon {
            position: absolute;
            width: 80px;
            height: 80px;
            top: 15%;
            right: 20%;
            background: 
                radial-gradient(circle at 30% 30%, #f8fafc 0%, #e2e8f0 50%, #cbd5e0 100%);
            border-radius: 50%;
            box-shadow: 
                0 0 40px rgba(248, 250, 252, 0.3),
                inset -10px -10px 0 rgba(203, 213, 224, 0.2);
            opacity: 0;
            transition: opacity 0.5s ease;
            animation: moonGlow 6s ease-in-out infinite alternate;
        }

        body.night .moon {
            opacity: 1;
        }

        @keyframes moonGlow {
            0% { 
                box-shadow: 
                    0 0 40px rgba(248, 250, 252, 0.3),
                    inset -10px -10px 0 rgba(203, 213, 224, 0.2);
            }
            100% { 
                box-shadow: 
                    0 0 60px rgba(248, 250, 252, 0.5),
                    inset -10px -10px 0 rgba(203, 213, 224, 0.3);
            }
        }

        /* Floating shapes with theme-specific styling */
        .shape {
            position: absolute;
            border-radius: 50%;
            animation: float 15s infinite ease-in-out;
            transition: all 0.5s ease;
        }

        /* Day theme shapes */
        body.day .shape {
            background: 
                radial-gradient(circle at 30% 30%, rgba(255, 255, 255, 0.4) 0%, rgba(255, 237, 213, 0.1) 100%),
                rgba(254, 215, 170, 0.15);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(251, 191, 36, 0.2);
            box-shadow: 
                inset 0 1px 0 rgba(255, 255, 255, 0.4),
                0 4px 20px rgba(251, 191, 36, 0.1);
        }

        /* Night theme shapes */
        body.night .shape {
            background: 
                radial-gradient(circle at 30% 30%, rgba(255, 255, 255, 0.1) 0%, rgba(71, 85, 105, 0.1) 100%),
                rgba(30, 41, 59, 0.15);
            backdrop-filter: blur(4px);
            border: 1px solid rgba(248, 250, 252, 0.1);
            box-shadow: 
                inset 0 1px 0 rgba(255, 255, 255, 0.1),
                0 4px 20px rgba(30, 41, 59, 0.2);
        }

        .shape:nth-child(1) {
            width: 300px;
            height: 300px;
            top: -150px;
            left: -150px;
            animation-delay: 0s;
        }

        .shape:nth-child(2) {
            width: 200px;
            height: 200px;
            top: 50%;
            right: -100px;
            animation-delay: 5s;
            animation-direction: reverse;
        }

        .shape:nth-child(3) {
            width: 150px;
            height: 150px;
            bottom: -75px;
            left: 20%;
            animation-delay: 10s;
        }

        @keyframes float {
            0%, 100% { transform: translateY(0) rotate(0deg); }
            33% { transform: translateY(-30px) rotate(120deg); }
            66% { transform: translateY(-60px) rotate(240deg); }
        }

        .login-container {
            background: 
                radial-gradient(circle at 50% 0%, rgba(255, 255, 255, 0.3) 0%, rgba(255, 255, 255, 0.1) 50%),
                rgba(255, 255, 255, 0.15);
            backdrop-filter: blur(30px) saturate(180%);
            border: 1px solid rgba(255, 255, 255, 0.4);
            border-radius: 24px;
            padding: 48px;
            width: 100%;
            max-width: 420px;
            box-shadow: 
                0 25px 50px rgba(0, 0, 0, 0.1),
                0 0 80px rgba(255, 255, 255, 0.05),
                inset 0 1px 0 rgba(255, 255, 255, 0.5),
                inset 0 -1px 0 rgba(255, 255, 255, 0.2);
            position: relative;
            z-index: 1;
            transform: translateY(20px);
            opacity: 0;
            animation: slideIn 0.8s ease-out forwards;
            transition: all 0.5s ease;
        }

        /* Day theme login container */
        body.day .login-container {
            box-shadow: 
                0 25px 50px rgba(217, 119, 6, 0.08),
                0 0 80px rgba(254, 215, 170, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.6),
                inset 0 -1px 0 rgba(255, 237, 213, 0.3);
        }

        /* Night theme login container */
        body.night .login-container {
            background: 
                radial-gradient(circle at 50% 0%, rgba(255, 255, 255, 0.15) 0%, rgba(255, 255, 255, 0.05) 50%),
                rgba(30, 41, 59, 0.2);
            box-shadow: 
                0 25px 50px rgba(15, 23, 42, 0.3),
                0 0 80px rgba(71, 85, 105, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.2),
                inset 0 -1px 0 rgba(248, 250, 252, 0.1);
        }

        @keyframes slideIn {
            to {
                transform: translateY(0);
                opacity: 1;
            }
        }

        .logo {
            text-align: center;
            margin-bottom: 32px;
        }

        .logo-icon {
            width: 56px;
            height: 56px;
            background: linear-gradient(135deg, #3b82f6, #1d4ed8);
            border-radius: 16px;
            margin: 0 auto 16px;
            display: flex;
            align-items: center;
            justify-content: center;
            animation: pulse 2s ease-in-out infinite;
            box-shadow: 0 8px 32px rgba(59, 130, 246, 0.3);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        @keyframes pulse {
            0%, 100% { transform: scale(1); }
            50% { transform: scale(1.05); }
        }

        .logo-icon::before {
            content: "🚀";
            font-size: 24px;
        }

        .welcome-text {
            text-align: center;
            margin-bottom: 32px;
        }

        .welcome-text h1 {
            font-size: 28px;
            font-weight: 700;
            margin-bottom: 8px;
            letter-spacing: -0.02em;
            text-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
            transition: color 0.5s ease;
        }

        .welcome-text p {
            font-size: 16px;
            font-weight: 400;
            transition: color 0.5s ease;
        }

        /* Day theme text colors */
        body.day .welcome-text h1 {
            color: #92400e;
        }

        body.day .welcome-text p {
            color: #a16207;
        }

        /* Night theme text colors */
        body.night .welcome-text h1 {
            color: #f8fafc;
        }

        body.night .welcome-text p {
            color: #cbd5e0;
        }

        .form-group {
            margin-bottom: 24px;
            position: relative;
        }

        .form-group label {
            display: block;
            font-size: 14px;
            font-weight: 600;
            color: #0c4a6e;
            margin-bottom: 8px;
            transition: color 0.2s ease;
        }

        .form-group input {
            width: 100%;
            padding: 16px 20px;
            border: 2px solid rgba(56, 189, 248, 0.2);
            border-radius: 12px;
            font-size: 16px;
            background: 
                radial-gradient(circle at top left, rgba(255, 255, 255, 0.4) 0%, rgba(255, 255, 255, 0.1) 100%),
                rgba(240, 249, 255, 0.3);
            backdrop-filter: blur(15px);
            color: #0c4a6e;
            transition: all 0.3s ease;
            outline: none;
        }

        .form-group input::placeholder {
            color: #0891b2;
        }

        .form-group input:focus {
            border-color: #0ea5e9;
            box-shadow: 
                0 0 0 4px rgba(14, 165, 233, 0.15),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
            transform: translateY(-1px);
            background: 
                radial-gradient(circle at top left, rgba(255, 255, 255, 0.5) 0%, rgba(255, 255, 255, 0.2) 100%),
                rgba(240, 249, 255, 0.4);
        }

        .form-group input:focus + label,
        .form-group.focused label {
            color: #0284c7;
        }

        .forgot-password {
            text-align: right;
            margin-bottom: 32px;
        }

        .forgot-password a {
            color: #0284c7;
            text-decoration: none;
            font-size: 14px;
            font-weight: 500;
            transition: color 0.2s ease;
        }

        .forgot-password a:hover {
            color: #0369a1;
            text-decoration: underline;
        }

        .login-btn {
            width: 100%;
            padding: 16px;
            background: 
                linear-gradient(135deg, #0ea5e9 0%, #0284c7 100%),
                radial-gradient(circle at top, rgba(255, 255, 255, 0.2) 0%, transparent 70%);
            color: white;
            border: none;
            border-radius: 12px;
            font-size: 16px;
            font-weight: 600;
            cursor: pointer;
            transition: all 0.3s ease;
            position: relative;
            overflow: hidden;
            box-shadow: 
                0 4px 15px rgba(14, 165, 233, 0.3),
                inset 0 1px 0 rgba(255, 255, 255, 0.2);
            border: 1px solid rgba(255, 255, 255, 0.2);
        }

        .login-btn:hover {
            transform: translateY(-2px);
            box-shadow: 
                0 10px 25px rgba(14, 165, 233, 0.4),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
        }

        .login-btn:active {
            transform: translateY(0);
        }

        .login-btn::before {
            content: '';
            position: absolute;
            top: 0;
            left: -100%;
            width: 100%;
            height: 100%;
            background: linear-gradient(90deg, transparent, rgba(255, 255, 255, 0.2), transparent);
            transition: left 0.5s ease;
        }

        .login-btn:hover::before {
            left: 100%;
        }

        .divider {
            display: flex;
            align-items: center;
            margin: 32px 0;
        }

        .divider::before,
        .divider::after {
            content: '';
            flex: 1;
            height: 1px;
            background: rgba(56, 189, 248, 0.3);
        }

        .divider span {
            padding: 0 16px;
            color: #0891b2;
            font-size: 14px;
            font-weight: 500;
        }

        .social-login {
            display: flex;
            gap: 16px;
            margin-bottom: 32px;
        }

        .social-btn {
            flex: 1;
            padding: 12px;
            border: 2px solid rgba(56, 189, 248, 0.2);
            border-radius: 12px;
            background: 
                radial-gradient(circle at top left, rgba(255, 255, 255, 0.4) 0%, rgba(255, 255, 255, 0.1) 100%),
                rgba(240, 249, 255, 0.2);
            backdrop-filter: blur(15px);
            cursor: pointer;
            transition: all 0.3s ease;
            display: flex;
            align-items: center;
            justify-content: center;
            font-size: 14px;
            font-weight: 500;
            color: #0c4a6e;
        }

        .social-btn:hover {
            border-color: rgba(56, 189, 248, 0.4);
            background: 
                radial-gradient(circle at top left, rgba(255, 255, 255, 0.5) 0%, rgba(255, 255, 255, 0.2) 100%),
                rgba(240, 249, 255, 0.3);
            transform: translateY(-1px);
            box-shadow: 
                0 4px 12px rgba(56, 189, 248, 0.1),
                inset 0 1px 0 rgba(255, 255, 255, 0.3);
        }

        .signup-link {
            text-align: center;
            color: #0891b2;
            font-size: 14px;
        }

        .signup-link a {
            color: #0284c7;
            text-decoration: none;
            font-weight: 600;
            transition: color 0.2s ease;
        }

        .signup-link a:hover {
            color: #0369a1;
        }

        /* Loading animation for button */
        .loading {
            position: relative;
            pointer-events: none;
        }

        .loading::after {
            content: '';
            position: absolute;
            width: 20px;
            height: 20px;
            border: 2px solid transparent;
            border-top: 2px solid white;
            border-radius: 50%;
            left: 50%;
            top: 50%;
            margin-left: -10px;
            margin-top: -10px;
            animation: spin 1s linear infinite;
        }

        @keyframes spin {
            0% { transform: rotate(0deg); }
            100% { transform: rotate(360deg); }
        }

        .loading span {
            opacity: 0;
        }

        /* Responsive design */
        @media (max-width: 480px) {
            .login-container {
                padding: 32px 24px;
                margin: 16px;
            }
            
            .welcome-text h1 {
                font-size: 24px;
            }
            
            .social-login {
                flex-direction: column;
            }
        }

        /* Custom scrollbar */
        ::-webkit-scrollbar {
            width: 6px;
        }

        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }

        ::-webkit-scrollbar-thumb {
            background: #c1c1c1;
            border-radius: 3px;
        }

        ::-webkit-scrollbar-thumb:hover {
            background: #a8a8a8;
        }
    </style>
</head>
<body>
    <div class="background-shapes">
        <!-- Sun for day theme -->
        <div class="sun"></div>
        
        <!-- Stars for night theme -->
        <div class="stars">
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
            <div class="star"></div>
        </div>
        
        <!-- Moon for night theme -->
        <div class="moon"></div>
        
        <!-- Floating shapes -->
        <div class="shape"></div>
        <div class="shape"></div>
        <div class="shape"></div>
    </div>

    <div class="login-container">
        <div class="logo">
            <div class="logo-icon"></div>
        </div>

        <div class="welcome-text">
            <h1>Welcome back</h1>
            <p>Sign in to your account to continue</p>
        </div>

        <form id="loginForm">
            <div class="form-group">
                <label for="email">Email address</label>
                <input type="email" id="email" name="email" required>
            </div>

            <div class="form-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" required>
            </div>

            <div class="forgot-password">
                <a href="#" onclick="showForgotPassword()">Forgot your password?</a>
            </div>

            <button type="submit" class="login-btn">
                <span>Sign in</span>
            </button>
        </form>

        <div class="divider">
            <span>Or continue with</span>
        </div>

        <div class="social-login">
            <button class="social-btn" onclick="socialLogin('google')">
                🔍 Google
            </button>
            <button class="social-btn" onclick="socialLogin('github')">
                🐙 GitHub
            </button>
        </div>

        <div class="signup-link">
            Don't have an account? <a href="#" onclick="showSignup()">Sign up</a>
        </div>
    </div>

    <script>
        // Time-based theme switching
        function updateTheme() {
            const now = new Date();
            const hour = now.getHours();
            const body = document.body;
            
            // Day: 6 AM to 6 PM (6-18), Night: 6 PM to 6 AM (18-6)
            if (hour >= 6 && hour < 18) {
                body.classList.remove('night');
                body.classList.add('day');
                console.log('Day theme activated');
            } else {
                body.classList.remove('day');
                body.classList.add('night');
                console.log('Night theme activated');
            }
        }

        // Initialize theme on page load
        updateTheme();

        // Update theme every minute
        setInterval(updateTheme, 60000);

        // Form handling with animations
        document.getElementById('loginForm').addEventListener('submit', function(e) {
            e.preventDefault();
            
            const button = this.querySelector('.login-btn');
            const span = button.querySelector('span');
            
            // Add loading state
            button.classList.add('loading');
            
            // Simulate login process
            setTimeout(() => {
                button.classList.remove('loading');
                
                // Success animation (you can replace with actual login logic)
                button.style.background = 'linear-gradient(135deg, #10b981, #059669)';
                span.textContent = 'Welcome back!';
                
                setTimeout(() => {
                    // Reset button state
                    button.style.background = '';
                    span.textContent = 'Sign in';
                }, 2000);
            }, 2000);
        });

        // Input focus animations
        const inputs = document.querySelectorAll('input');
        inputs.forEach(input => {
            input.addEventListener('focus', function() {
                this.parentElement.classList.add('focused');
            });
            
            input.addEventListener('blur', function() {
                if (!this.value) {
                    this.parentElement.classList.remove('focused');
                }
            });
        });

        // Social login handlers
        function socialLogin(provider) {
            alert(`${provider.charAt(0).toUpperCase() + provider.slice(1)} login would be implemented here`);
        }

        function showForgotPassword() {
            alert('Forgot password flow would be implemented here');
        }

        function showSignup() {
            alert('Sign up page would be implemented here');
        }

        // Add subtle parallax effect to background shapes
        document.addEventListener('mousemove', function(e) {
            const shapes = document.querySelectorAll('.shape');
            const x = e.clientX / window.innerWidth;
            const y = e.clientY / window.innerHeight;
            
            shapes.forEach((shape, index) => {
                const speed = (index + 1) * 0.5;
                const xOffset = (x - 0.5) * speed * 20;
                const yOffset = (y - 0.5) * speed * 20;
                
                shape.style.transform += ` translate(${xOffset}px, ${yOffset}px)`;
            });
        });

        // Theme toggle for testing (you can remove this in production)
        document.addEventListener('keydown', function(e) {
            if (e.key === 'T' || e.key === 't') {
                const body = document.body;
                if (body.classList.contains('day')) {
                    body.classList.remove('day');
                    body.classList.add('night');
                    console.log('Switched to night theme (manual)');
                } else {
                    body.classList.remove('night');
                    body.classList.add('day');
                    console.log('Switched to day theme (manual)');
                }
            }
        });
    </script>
</body>
</html>
