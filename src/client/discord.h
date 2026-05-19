#include <discord_register.h>
#include <discord_rpc.h>
#include <cstring>
#include <iostream>
#include <chrono>

class Discord {
public:
	Discord();
	~Discord();

	void Start();
	void Update();
	void Update(std::string name, std::string level);

	time_t time = std::time(0);
private:

	DiscordEventHandlers DiscordHandlers;
	DiscordRichPresence discordPresence;
};

extern Discord discord;