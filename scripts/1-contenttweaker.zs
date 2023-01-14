#loader contenttweaker

import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Commands;
import mods.contenttweaker.ActionResult;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.IItemUpdate;
import mods.contenttweaker.Hand;
import mods.contenttweaker.ItemFood;

var gravitonite = VanillaFactory.createBlock("gravitonite", <blockmaterial:rock>);
gravitonite.setBlockSoundType(<soundtype:stone>);
gravitonite.setBlockHardness(10.0);
gravitonite.setBlockResistance(1500);
gravitonite.setToolClass("pickaxe");
gravitonite.setToolLevel(10);
gravitonite.setDropHandler(function(drops, world, position, state, fortune) {
    drops.add(<item:contenttweaker:collapsed_stability>);
    return;
});
gravitonite.register();

var collapsedStability = VanillaFactory.createItem("collapsed_stability");
collapsedStability.maxStackSize = 1;
collapsedStability.rarity = "epic";
collapsedStability.register();


var gravityStabalizer = VanillaFactory.createItem("gravity_stabalizer");
gravityStabalizer.maxStackSize = 1;
gravityStabalizer.rarity = "epic";
gravityStabalizer.toolClass = "pickaxe";
gravityStabalizer.toolLevel = 10;
gravityStabalizer.maxDamage = 1;
gravityStabalizer.itemDestroyedBlock = function(stack, world, blockState, pos, player) {
    stack.damage(2, player);
    return true;
};
gravityStabalizer.register();

var gravititeNugget = VanillaFactory.createItem("gravitite_nugget");
gravititeNugget.maxStackSize = 64;
gravititeNugget.rarity = "uncommon";
gravititeNugget.register();

var gravitite = VanillaFactory.createItem("gravitite");
gravitite.maxStackSize = 16;
gravitite.rarity = "uncommon";
gravitite.register();

//Trophies
var albinoScale = VanillaFactory.createItem("albino_scale");
albinoScale.maxStackSize = 1;
albinoScale.rarity = "uncommon";
albinoScale.register();

var hydraVial = VanillaFactory.createItem("hydra_vial");
hydraVial.maxStackSize = 1;
hydraVial.rarity = "uncommon";
hydraVial.register();

var possessedPlate = VanillaFactory.createItem("possessed_plate");
possessedPlate.maxStackSize = 1;
possessedPlate.rarity = "uncommon";
possessedPlate.register();

var dragonSoulGem = VanillaFactory.createItem("dragon_soul_gem");
dragonSoulGem.maxStackSize = 1;
dragonSoulGem.rarity = "uncommon";
dragonSoulGem.register();

var sunOrange = VanillaFactory.createItem("sun_orange");
sunOrange.maxStackSize = 1;
sunOrange.rarity = "uncommon";
sunOrange.register();

var frostmawHorn = VanillaFactory.createItem("frostmaw_horn");
frostmawHorn.maxStackSize = 1;
frostmawHorn.rarity = "uncommon";
frostmawHorn.register();

var trollTusk = VanillaFactory.createItem("troll_tusk");
trollTusk.maxStackSize = 1;
trollTusk.rarity = "uncommon";
trollTusk.register();

var cyclopsHorn = VanillaFactory.createItem("cyclops_horn");
cyclopsHorn.maxStackSize = 1;
cyclopsHorn.rarity = "uncommon";
cyclopsHorn.register();

//the totally legal medicine section

var crystalMethamphetamine = VanillaFactory.createItem("crystalized_methamphetamine");
crystalMethamphetamine.maxStackSize = 64;
crystalMethamphetamine.register();

var totallybread = VanillaFactory.createItemFood("totally_bread", 5);
totallybread.healAmount = 5;
totallybread.saturation = 6;
totallybread.alwaysEdible = true;
totallybread.onItemFoodEaten = function(stack, world, player) {
    if (!world.isRemote()) {
        player.addPotionEffect(<potion:minecraft:speed>.makePotionEffect(5200, 2));
        player.addPotionEffect(<potion:minecraft:saturation>.makePotionEffect(5200, 0));
        player.addPotionEffect(<potion:minecraft:strength>.makePotionEffect(5200, 1));
        player.addPotionEffect(<potion:minecraft:night_vision>.makePotionEffect(5200, 0));
        player.sendStatusMessage("You feel on top of the world, but a nagging sense of dread...");
        Commands.call("scoreboard players add @p dosage 1", player, world, false, true);

    }
};
totallybread.register();