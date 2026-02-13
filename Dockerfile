# Use official Python image
FROM python:3.10-slim

# Set working directory
WORKDIR /app

# Copy requirements first
COPY requirements.txt .

# Install dependencies
RUN pip install --no-cache-dir -r requirements.txt

# Copy project files
COPY . .

# Expose port 5000
EXPOSE 5000

# Run gunicorn on port 5000
CMD ["gunicorn", "--bind", "0.0.0.0:5000", "app:app"]



