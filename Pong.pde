Ball ball;
Paddle leftPaddle;
Paddle rightPaddle;
int leftScore = 0;
int rightScore = 0;

void setup() {
  fullScreen();
  ball = new Ball(width / 2, height / 2, 50);
  ball.speedX = 10;
  ball.speedY = random(-6, 6);
  leftPaddle = new Paddle(80, height / 2, 30, 200);
  rightPaddle = new Paddle(width - 80, height / 2, 30, 200);
}

void draw() {
  background(0);
  ball.move();
  ball.display();
  
  //making the ball bounce
  if (ball.right() > width) {
    leftScore++;
    ball.x = width / 2;
    ball.y = height / 2;
  }
  if (ball.left() < 0) {
    rightScore++;
    ball.x = width / 2;
    ball.y = height / 2;
  }
  if (ball.top() < 0) {
    ball.speedY = -ball.speedY;
  }
  if (ball.bottom() > height) {
    ball.speedY = -ball.speedY;
  }
  leftPaddle.move();
  leftPaddle.display();
  rightPaddle.move();
  rightPaddle.display();
  
  
  //paddle boundaries
  if (leftPaddle.bottom() > height) {
    leftPaddle.y = height - (leftPaddle.h / 2);
  }
  if (leftPaddle.top() < 0) {
    leftPaddle.y = leftPaddle.h / 2;
  }
  if (rightPaddle.bottom() > height) {
    rightPaddle.y = height - (rightPaddle.h / 2);
  }
  if (rightPaddle.top() < 0) {
    rightPaddle.y = rightPaddle.h / 2;
  }
  
  
  //ball and paddle collision
  if (ball.left() < leftPaddle.right() && ball.y > leftPaddle.top() && ball.y < leftPaddle.bottom()) {
    ball.speedX = -ball.speedX;
  }
  
  if (ball.right() > rightPaddle.left() && ball.y > rightPaddle.top() && ball.y < rightPaddle.bottom()) {
    ball.speedX = -ball.speedX;
  }
  
  
  /*
  //makes ball bounce in different directions based on where it touches the paddle
  if (ball.left() < leftPaddle.right() && ball.y > leftPaddle.top() && ball.y < leftPaddle.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - leftPaddle.y, -leftPaddle.h/2, leftPaddle.h/2, -10, 10);
  }

  if ( ball.right() > rightPaddle.left() && ball.y > rightPaddle.top() && ball.y < rightPaddle.bottom()) {
    ball.speedX = -ball.speedX;
    ball.speedY = map(ball.y - rightPaddle.y, -rightPaddle.h/2, rightPaddle.h/2, -10, 10);
  }
  */


  //score
  textSize(40);
  textAlign(CENTER);
  text(rightScore, (width / 2) + 500, 100);
  text(leftScore, (width / 2) - 500, 100);
}

class Ball {
  float x;
  float y;
  float speedX;
  float speedY;
  float diameter;
  color c;
  
  Ball(float tempX, float tempY, float tempDiameter) {
    x = tempX;
    y = tempY;
    diameter = tempDiameter;
    speedX = 0;
    speedY = 0;
    c = (225);
  }

  void move() {
    y = y + speedY;
    x = x + speedX;
  }

  void display() {
    fill(c);
    ellipse(x, y, diameter, diameter);
  }

  float left() {
    return x - (diameter / 2);
  }

  float right() {
    return x + (diameter / 2);
  }

  float top() {
    return y - (diameter / 2);
  }

  float bottom() {
    return y + (diameter / 2);
  }
}

class Paddle {
  float x;
  float y;
  float w;
  float h;
  float speedX;
  float speedY;
  color c;
  
  Paddle (float tempX, float tempY, float tempW, float tempH) {
    x = tempX;
    y = tempY;
    w = tempW;
    h = tempH;
    speedY = 0;
    c = (255);
  }
  
  void move() {
    y = y + speedY;
    x = x + speedX;
  }
  
  void display() {
    fill(c);
    rect(x - (w / 2), y - (h / 2), w, h, 7);
  }
  
  float left() {
    return x - (w / 2);
  }
  
  float right() {
    return x + (w / 2);
  }
  
  float top() {
    return y - (h / 2);
  }
  
  float bottom() {
    return y + (h / 2);
  }
}

void keyPressed() {
  if (keyCode == UP) {
    rightPaddle.speedY = -6;
  }
  if (keyCode == DOWN) {
    rightPaddle.speedY = 6;
  }
  if (key == 'w') {
    leftPaddle.speedY = -6;
  }
  if (key == 's') {
    leftPaddle.speedY = 6;
  }
}

void keyReleased() {
  if (keyCode == UP) {
    rightPaddle.speedY = 0;
  }
  if (keyCode == DOWN) {
    rightPaddle.speedY = 0;
  }
  if (key == 'w') {
    leftPaddle.speedY = 0;
  }
  if (key == 's') {
    leftPaddle.speedY = 0;
  }
}
