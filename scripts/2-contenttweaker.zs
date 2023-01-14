#loader contenttweaker

import mods.contenttweaker.Color;
import mods.contenttweaker.VanillaFactory;
import mods.contenttweaker.Item;
import mods.contenttweaker.Commands;
import mods.contenttweaker.ActionResult;
import mods.contenttweaker.BlockState;
import mods.contenttweaker.IItemUpdate;
import mods.contenttweaker.Hand;

var gravitonite = VanillaFactory.createBlock("gravitonite", <blockmaterial:rock>);
gravitonite.setBlockSoundType(<soundtype:stone>);
gravitonite.setBlockHardness(10.0);
gravitonite.setBlockResistance(1500);
gravitonite.setToolClass("pickaxe");
gravitonite.setToolLevel(5);
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
gravityStabalizer.toolLevel = 5;
gravityStabalizer.maxDamage = 1;
gravityStabalizer.itemDestroyedBlock = function(stack, world, blockState, pos, player) {
    stack.damage(2, player);
    return true;
};
gravityStabalizer.register();


var gravititeNugget = VanillaFactory.createItem("gravitite_nugget");
gravititeNugget.maxStackSize = 32;
gravititeNugget.rarity = "uncommon";
gravititeNugget.register();

var gravitite = VanillaFactory.createItem("gravitite");
gravitite.maxStackSize = 16;
gravitite.rarity = "uncommon";
gravitite.register();
