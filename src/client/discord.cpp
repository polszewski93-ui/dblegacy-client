#include "discord.h"

Discord discord;

Discord::Discord() {

}

Discord::~Discord() {

}

void Error(int error, const char * message) {

}

void User(const DiscordUser* user) {

}

void Discord::Start() {
    memset(&DiscordHandlers, 0, sizeof(DiscordHandlers));

    DiscordHandlers.ready = User;
    DiscordHandlers.errored = Error;

    Discord_Initialize("1129757342079139972", &DiscordHandlers, 1, 0);
}

void Discord::Update() {
    memset(&discordPresence, 0, sizeof(discordPresence));
    discordPresence.largeImageKey = "image___";
    discordPresence.largeImageText = "Adventure Z";
    discordPresence.partyId = "ae488379-351d-4a4f-ad32-2b9b01c91657";
    discordPresence.startTimestamp = time;
    Discord_UpdatePresence(&discordPresence);
}

void Discord::Update(std::string name, std::string level) {
    std::string level_char = "Level : " + level;
    std::string name_char = "Nickname : " + name;

    memset(&discordPresence, 0, sizeof(discordPresence));
    discordPresence.state = level_char.c_str();
    discordPresence.details = name_char.c_str();
    discordPresence.largeImageKey = "image___";
    discordPresence.largeImageText = "Adventure Z";
    discordPresence.smallImageKey = "icons8-dragon-ball-legends-1024";
    discordPresence.smallImageText = "www.adventurezonline.com";
    discordPresence.partyId = "ae488379-351d-4a4f-ad32-2b9b01c91657";
    discordPresence.startTimestamp = time;
    Discord_UpdatePresence(&discordPresence);
}