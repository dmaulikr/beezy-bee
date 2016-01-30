//
//  BEENewGameView.m
//  beezy-bee
//
//  Created by Hiroshi on 1/27/16.
//  Copyright © 2016 Ideia do Luiz. All rights reserved.
//

#import "BEENewGameView.h"
#import "BEESessionHelper.h"
#import "BEEPlayer.h"

@interface BEENewGameView ()

@property (nonatomic) NSMutableArray *objArray;

@end


@implementation BEENewGameView

+ (instancetype) sharedInstance
{
    static BEENewGameView *sharedStore;
    
    if (!sharedStore)
        sharedStore = [[self alloc] initPrivate];
    
    return sharedStore;
}

- (instancetype) init
{
    [NSException raise:@"Singleton" format:@"Use [BEENewGameView sharedInstance]"];
    return nil;
}

- (instancetype) initPrivate
{
    self = [super init];
    
    if (self)
    {
        _objArray = [NSMutableArray array];
    }
    
    return self;
}

- (void) createNewGameWithParentScene:(SKScene *)parent
{
    [BEESessionHelper sharedInstance].currentScreen = BST_GAME;
    parent.physicsWorld.gravity = CGVectorMake( 0.0, -5 );
    
    //That is your player
    //BEEPlayer *player = [[BEEPlayer alloc] initWithImageNamed:@"First-Bee" position:CGPointMake(CGRectGetMidX(parent.frame),CGRectGetMidY(parent.frame) - 100) andParentScene:parent];
    SKTexture* birdTexture1 = [SKTexture textureWithImageNamed:@"First-Bee"];
    birdTexture1.filteringMode = SKTextureFilteringNearest;
    SKTexture* birdTexture2 = [SKTexture textureWithImageNamed:@"First-Bee-Move"];
    birdTexture2.filteringMode = SKTextureFilteringNearest;
    
    SKSpriteNode *player = [SKSpriteNode spriteNodeWithTexture:birdTexture1];
    SKAction* flap = [SKAction repeatActionForever:[SKAction animateWithTextures:@[birdTexture1, birdTexture2] timePerFrame:0.2]];
    player.yScale = 0.35;
    player.xScale = 0.35;
    player.position = CGPointMake(CGRectGetMidX(parent.frame)/2,CGRectGetMidY(parent.frame));
    [parent addChild:player];
    [player runAction:flap];
    
    SKTexture* birdTexture3 = [SKTexture textureWithImageNamed:@"Monster-Wasp"];
    birdTexture1.filteringMode = SKTextureFilteringNearest;
    SKTexture* birdTexture4 = [SKTexture textureWithImageNamed:@"Monster-Wasp-Move"];
    birdTexture2.filteringMode = SKTextureFilteringNearest;
    
    SKSpriteNode *monster = [SKSpriteNode spriteNodeWithTexture:birdTexture1];
    SKAction* flap1 = [SKAction repeatActionForever:[SKAction animateWithTextures:@[birdTexture3, birdTexture4] timePerFrame:0.2]];
    monster.yScale = 0.5;
    monster.xScale = 0.5;
    monster.position = CGPointMake(CGRectGetMidX(parent.frame)*2 - monster.size.width,CGRectGetMidY(parent.frame));
    [parent addChild:monster];
    [monster runAction:flap1];
    
    __weak SKSpriteNode *weakObj = player;
    [self.objArray addObject:weakObj];
    
    __weak SKSpriteNode *weakObj1 = monster;
    [self.objArray addObject:weakObj1];
}

- (void) deleteObjectsFromParent
{
    if ([self.objArray count] > 0)
    {
        for (SKLabelNode *obj in self.objArray)
            [obj removeFromParent];
        
        self.objArray = [NSMutableArray array];
    }
}

@end
