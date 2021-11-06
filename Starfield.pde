Particle [] particles;
void setup()
{
	size(300,250);
	particles = new Particle[200];
	for(int i = 0; i < particles.length; i++)
	{
		particles[i] = new NormalParticle();
	}
	particles[0] = new OddballParticle();
	particles[1] = new HugeParticle();
	frameRate(50);
}

void draw()
{
	background(224,255,255);
	for(int i = 0; i < particles.length; i++)
	{
		particles[i].show();
		particles[i].move();
	}
}

interface Particle
{
	public void move();
	public void show();
}

class NormalParticle implements Particle
{
	double normalX, normalY, dAngle;
	int dSpeed;
	NormalParticle()
	{
		normalX = 150;
		normalY = 125;
		dSpeed = (int)(Math.random()*3)+1;
		dAngle = Math.PI*2*Math.random();
	}
	public void move()
	{
		normalX = normalX + dSpeed * (Math.random()*Math.sin(dAngle));
		normalY = normalY + dSpeed * (Math.random()*Math.cos(dAngle));
	}
	public void show()
	{
		//fill((float)(Math.random()*100)+1, (float)(Math.random()*205)+50, (float)(Math.random()*55)+200);
		fill((float)(Math.random()*255)+1, (float)(Math.random()*55)+200, 255, (float)(Math.random()*20)+150);
		noStroke();
		rect((float)normalX,(float)normalY,3,3);
	}
}

class OddballParticle implements Particle
{
	double oddX, oddY;
	OddballParticle()
	{
		oddX = (Math.random()*150)+75;
		oddY = (Math.random()*125)+75;
	}
	public void move()
	{
		oddX = (Math.random()*25)+130;
		oddY = (Math.random()*25)+115;
	}
	public void show()
	{
		fill(100,100,255);
		noStroke();
		rect((float)oddX,(float)oddY,6,6);
	}
}
class HugeParticle extends NormalParticle
{
	public void show()
	{
		fill(0);
		noStroke();
		rect((float)normalX,(float)normalY,6,6);
	}
}
