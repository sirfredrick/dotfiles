package main

import (
	"log"
	"math/rand"
	"os"
	"os/exec"
	"time"
)

type wallpaper struct {
	filename string
	location string
	icon     rune
}

var day = []wallpaper{
	wallpaper{
		filename: "cauldros1",
		location: "Mount M'gando",
		icon:     '',
	},
	wallpaper{
		filename: "cauldros2",
		location: "Scholes Battlegrounds",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum1",
		location: "Canopied Nightwood",
		icon:     '盛',
	},
	wallpaper{
		filename: "noctilum2",
		location: "Middle Hushflood",
		icon:     '盛',
	},
	wallpaper{
		filename: "oblivia1",
		location: "          ",
		icon:     '盛',
	},
	wallpaper{
		filename: "oblivia2",
		location: "          ",
		icon:     '盛',
	},
	wallpaper{
		filename: "oblivia3",
		location: "          ",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia1",
		location: "West Janpath Plain",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia2",
		location: "          ",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia3",
		location: "Biahno Lake",
		icon:     '盛',
	},
	wallpaper{
		filename: "slyvalum1",
		location: "Hilal Meadow",
		icon:     '',
	},
	wallpaper{
		filename: "slyvalum2",
		location: "Delusians South Summit",
		icon:     '',
	},
}

var night = []wallpaper{
	wallpaper{
		filename: "cauldros1",
		location: "FN Site 504",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum1",
		location: "          ",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum2",
		location: "Rustpool Banks BC",
		icon:     '盛',
	},
	wallpaper{
		filename: "slyvalum1",
		location: "Needle Rock Sandsea",
		icon:     'ﲋ',
	},
}

func isDaytime() bool {
	hr := time.Now().Hour()
	if hr > 5 && hr < 17 {
		return true
	} else {
		return false
	}
}

func changeWallpaper(wp wallpaper) {
	home, err := os.UserHomeDir()
	if err != nil {
		log.Fatal(err)
	}
	path := home + "/.local/share/backgrounds"
	if isDaytime() {
		path += "/day"
	} else {
		path += "/night"
	}
	path += "/" + wp.filename + ".jpg"
	cmd := exec.Command("swaymsg", "output * bg '"+path+"' fill")
	err = cmd.Run()
	if err != nil {
		log.Fatal(err)
	}
}

func writeConfig(wp wallpaper) {
	home, err := os.UserHomeDir()
	f, err := os.Create(home + "/.local/share/backgrounds/area")
	if err != nil {
		log.Fatal(err)
	}
	ltr := ""
	if !isDaytime() && wp.filename == "slyvalum1" {
		// Left-to-right mark
		ltr += string('\u200e')
	}
	_, err = f.WriteString(wp.filename + "\n" + string(wp.icon) + ltr + "\n" + wp.location)
	if err != nil {
		log.Fatal(err)
	}
	if err := f.Close(); err != nil {
		log.Fatal(err)
	}
}

func randWallpaper() wallpaper {
	rand.Seed(time.Now().UnixNano())
	if isDaytime() {
		return day[rand.Intn(len(day))]
	} else {
		return night[rand.Intn(len(night))]
	}
}

func main() {
	wp := randWallpaper()
	changeWallpaper(wp)
	writeConfig(wp)
}
