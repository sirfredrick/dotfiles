package main

import (
	"github.com/xyproto/wallutils"
	"log"
	"math/rand"
	"os"
	"time"
)

type wallpaper struct {
	filename string
	icon     rune
}

var day = []wallpaper{
	wallpaper{
		filename: "cauldros1",
		icon:     '',
	},
	wallpaper{
		filename: "cauldros2",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum1",
		icon:     '盛',
	},
	wallpaper{
		filename: "noctilum2",
		icon:     '盛',
	},
	wallpaper{
		filename: "obilivia1",
		icon:     '盛',
	},
	wallpaper{
		filename: "oblivia2",
		icon:     '盛',
	},
	wallpaper{
		filename: "oblivia3",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia1",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia2",
		icon:     '盛',
	},
	wallpaper{
		filename: "primordia3",
		icon:     '盛',
	},
	wallpaper{
		filename: "slyvalum1",
		icon:     '',
	},
	wallpaper{
		filename: "slyvalum2",
		icon:     '',
	},
}

var night = []wallpaper{
	wallpaper{
		filename: "cauldros1",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum1",
		icon:     '',
	},
	wallpaper{
		filename: "noctilum2",
		icon:     '盛',
	},
	wallpaper{
		filename: "slyvalum1",
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
	err = wallutils.SetWallpaper(path)
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
	_, err = f.WriteString(wp.filename + " " + string(wp.icon) + ltr)
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
