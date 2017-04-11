// Generated by Apple Swift version 3.1 (swiftlang-802.0.48 clang-802.0.38)
#pragma clang diagnostic push

#if defined(__has_include) && __has_include(<swift/objc-prologue.h>)
# include <swift/objc-prologue.h>
#endif

#pragma clang diagnostic ignored "-Wauto-import"
#include <objc/NSObject.h>
#include <stdint.h>
#include <stddef.h>
#include <stdbool.h>

#if !defined(SWIFT_TYPEDEFS)
# define SWIFT_TYPEDEFS 1
# if defined(__has_include) && __has_include(<uchar.h>)
#  include <uchar.h>
# elif !defined(__cplusplus) || __cplusplus < 201103L
typedef uint_least16_t char16_t;
typedef uint_least32_t char32_t;
# endif
typedef float swift_float2  __attribute__((__ext_vector_type__(2)));
typedef float swift_float3  __attribute__((__ext_vector_type__(3)));
typedef float swift_float4  __attribute__((__ext_vector_type__(4)));
typedef double swift_double2  __attribute__((__ext_vector_type__(2)));
typedef double swift_double3  __attribute__((__ext_vector_type__(3)));
typedef double swift_double4  __attribute__((__ext_vector_type__(4)));
typedef int swift_int2  __attribute__((__ext_vector_type__(2)));
typedef int swift_int3  __attribute__((__ext_vector_type__(3)));
typedef int swift_int4  __attribute__((__ext_vector_type__(4)));
typedef unsigned int swift_uint2  __attribute__((__ext_vector_type__(2)));
typedef unsigned int swift_uint3  __attribute__((__ext_vector_type__(3)));
typedef unsigned int swift_uint4  __attribute__((__ext_vector_type__(4)));
#endif

#if !defined(SWIFT_PASTE)
# define SWIFT_PASTE_HELPER(x, y) x##y
# define SWIFT_PASTE(x, y) SWIFT_PASTE_HELPER(x, y)
#endif
#if !defined(SWIFT_METATYPE)
# define SWIFT_METATYPE(X) Class
#endif
#if !defined(SWIFT_CLASS_PROPERTY)
# if __has_feature(objc_class_property)
#  define SWIFT_CLASS_PROPERTY(...) __VA_ARGS__
# else
#  define SWIFT_CLASS_PROPERTY(...)
# endif
#endif

#if defined(__has_attribute) && __has_attribute(objc_runtime_name)
# define SWIFT_RUNTIME_NAME(X) __attribute__((objc_runtime_name(X)))
#else
# define SWIFT_RUNTIME_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(swift_name)
# define SWIFT_COMPILE_NAME(X) __attribute__((swift_name(X)))
#else
# define SWIFT_COMPILE_NAME(X)
#endif
#if defined(__has_attribute) && __has_attribute(objc_method_family)
# define SWIFT_METHOD_FAMILY(X) __attribute__((objc_method_family(X)))
#else
# define SWIFT_METHOD_FAMILY(X)
#endif
#if defined(__has_attribute) && __has_attribute(noescape)
# define SWIFT_NOESCAPE __attribute__((noescape))
#else
# define SWIFT_NOESCAPE
#endif
#if defined(__has_attribute) && __has_attribute(warn_unused_result)
# define SWIFT_WARN_UNUSED_RESULT __attribute__((warn_unused_result))
#else
# define SWIFT_WARN_UNUSED_RESULT
#endif
#if !defined(SWIFT_CLASS_EXTRA)
# define SWIFT_CLASS_EXTRA
#endif
#if !defined(SWIFT_PROTOCOL_EXTRA)
# define SWIFT_PROTOCOL_EXTRA
#endif
#if !defined(SWIFT_ENUM_EXTRA)
# define SWIFT_ENUM_EXTRA
#endif
#if !defined(SWIFT_CLASS)
# if defined(__has_attribute) && __has_attribute(objc_subclassing_restricted)
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) __attribute__((objc_subclassing_restricted)) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# else
#  define SWIFT_CLASS(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
#  define SWIFT_CLASS_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_CLASS_EXTRA
# endif
#endif

#if !defined(SWIFT_PROTOCOL)
# define SWIFT_PROTOCOL(SWIFT_NAME) SWIFT_RUNTIME_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
# define SWIFT_PROTOCOL_NAMED(SWIFT_NAME) SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_PROTOCOL_EXTRA
#endif

#if !defined(SWIFT_EXTENSION)
# define SWIFT_EXTENSION(M) SWIFT_PASTE(M##_Swift_, __LINE__)
#endif

#if !defined(OBJC_DESIGNATED_INITIALIZER)
# if defined(__has_attribute) && __has_attribute(objc_designated_initializer)
#  define OBJC_DESIGNATED_INITIALIZER __attribute__((objc_designated_initializer))
# else
#  define OBJC_DESIGNATED_INITIALIZER
# endif
#endif
#if !defined(SWIFT_ENUM)
# define SWIFT_ENUM(_type, _name) enum _name : _type _name; enum SWIFT_ENUM_EXTRA _name : _type
# if defined(__has_feature) && __has_feature(generalized_swift_name)
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) enum _name : _type _name SWIFT_COMPILE_NAME(SWIFT_NAME); enum SWIFT_COMPILE_NAME(SWIFT_NAME) SWIFT_ENUM_EXTRA _name : _type
# else
#  define SWIFT_ENUM_NAMED(_type, _name, SWIFT_NAME) SWIFT_ENUM(_type, _name)
# endif
#endif
#if !defined(SWIFT_UNAVAILABLE)
# define SWIFT_UNAVAILABLE __attribute__((unavailable))
#endif
#if !defined(SWIFT_UNAVAILABLE_MSG)
# define SWIFT_UNAVAILABLE_MSG(msg) __attribute__((unavailable(msg)))
#endif
#if !defined(SWIFT_AVAILABILITY)
# define SWIFT_AVAILABILITY(plat, ...) __attribute__((availability(plat, __VA_ARGS__)))
#endif
#if !defined(SWIFT_DEPRECATED)
# define SWIFT_DEPRECATED __attribute__((deprecated))
#endif
#if !defined(SWIFT_DEPRECATED_MSG)
# define SWIFT_DEPRECATED_MSG(...) __attribute__((deprecated(__VA_ARGS__)))
#endif
#if defined(__has_feature) && __has_feature(modules)
@import ObjectiveC;
@import Foundation;
#endif

#pragma clang diagnostic ignored "-Wproperty-attribute-mismatch"
#pragma clang diagnostic ignored "-Wduplicate-method-arg"

SWIFT_CLASS("_TtC5Graph4Node")
@interface Node : NSObject
- (nonnull instancetype)init OBJC_DESIGNATED_INITIALIZER;
@end

@class Entity;
@class Graph;

SWIFT_CLASS_NAMED("Action")
@interface Action : Node
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
/// A reference to the type.
@property (nonatomic, readonly, copy) NSString * _Nonnull type;
/// A reference to the hash.
@property (nonatomic, readonly) NSUInteger hash;
/// A reference to the hashValue.
@property (nonatomic, readonly) NSInteger hashValue;
/// A reference to the ID.
@property (nonatomic, readonly, copy) NSString * _Nonnull id;
/// A reference to the createDate.
@property (nonatomic, readonly, copy) NSDate * _Nonnull createdDate;
/// A reference to tags.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull tags;
/// A reference to groups.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull groups;
- (id _Nullable)objectForKeyedSubscript:(NSString * _Nonnull)name SWIFT_WARN_UNUSED_RESULT;
- (void)setObject:(id _Nullable)value forKeyedSubscript:(NSString * _Nonnull)name;
/// A reference to the properties Dictionary.
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull properties;
/// An Array of Entity subjects.
@property (nonatomic, readonly, copy) NSArray<Entity *> * _Nonnull subjects;
/// An Array of Entity objects.
@property (nonatomic, readonly, copy) NSArray<Entity *> * _Nonnull objects;
/// Initializer that accepts a type and graph. The graph
/// indicates which graph to save to.
/// \param type A reference to a type.
///
/// \param graph A reference to a Graph instance.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type graph:(Graph * _Nonnull)graph;
/// Initializer that accepts a type value.
/// \param type A reference to a type.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type;
/// Checks equality between Entities.
/// \param object A reference to an object to test
/// equality against.
///
///
/// returns:
/// A boolean of the result, true if equal, false
/// otherwise.
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
/// Adds given tags to an Action.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)addWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Checks if the Action has the given tags.
/// \param tags An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given tags, false otherwise.
- (BOOL)hasWithTags:(NSArray<NSString *> * _Nonnull)tags SWIFT_WARN_UNUSED_RESULT;
/// Removes given tags from an Action.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)removeWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given tags to an Action or removes them, based on their
/// previous state.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)toggleWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given groups to an Action.
/// \param to groups An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)addTo:(NSArray<NSString *> * _Nonnull)groups;
/// Checks if the Action has a the given tags.
/// \param of groups An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given groups, false otherwise.
- (BOOL)memberOf:(NSArray<NSString *> * _Nonnull)groups SWIFT_WARN_UNUSED_RESULT;
/// Removes given groups from an Action.
/// \param from groups An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)removeFrom:(NSArray<NSString *> * _Nonnull)groups;
/// Adds given groups to an Action or removes them, based on their
/// previous state.
/// \param groups An Array of Strings.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)toggleWithGroups:(NSArray<NSString *> * _Nonnull)groups;
/// Adds an Array of Entity objects to the subject set.
/// \param subjects An Array of Entity objects.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)addWithSubjects:(NSArray<Entity *> * _Nonnull)subjects;
/// Removes an Array of Entity objects from the subject set.
/// \param subjects An Array of Entity objects.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)removeWithSubjects:(NSArray<Entity *> * _Nonnull)subjects;
/// Adds an Array of Entity objects to the objects set.
/// \param subjects An Array of Entity objects.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)addWithObjects:(NSArray<Entity *> * _Nonnull)objects;
/// Removes an Array of Entity objects from the subject set.
/// \param objects An Array of Entity objects.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)removeWithObjects:(NSArray<Entity *> * _Nonnull)objects;
/// Adds an Array of Entity objects to the objects set.
/// \param objects An Array of Entity objects.
///
///
/// returns:
/// The Action.
- (Action * _Nonnull)whatWithObjects:(NSArray<Entity *> * _Nonnull)objects;
/// Marks the Action for deletion.
- (void)delete;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface Action (SWIFT_EXTENSION(Graph))
/// Finds the given types of subject Entities that are part
/// of the Action.
/// \param types An Array of Strings.
///
///
/// returns:
/// An Array of Entities.
- (NSArray<Entity *> * _Nonnull)subjectWithTypes:(NSArray<NSString *> * _Nonnull)types SWIFT_WARN_UNUSED_RESULT;
/// Finds the given types of object Entities that are part
/// of the Action.
/// \param types An Array of Strings.
///
///
/// returns:
/// An Array of Entities.
- (NSArray<Entity *> * _Nonnull)objectWithTypes:(NSArray<NSString *> * _Nonnull)types SWIFT_WARN_UNUSED_RESULT;
@end

@class Relationship;

SWIFT_CLASS_NAMED("Entity")
@interface Entity : Node
/// A string representation of the Entity.
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
/// A reference to the type.
@property (nonatomic, readonly, copy) NSString * _Nonnull type;
/// A reference to the hash.
@property (nonatomic, readonly) NSUInteger hash;
/// A reference to the hashValue.
@property (nonatomic, readonly) NSInteger hashValue;
/// A reference to the ID.
@property (nonatomic, readonly, copy) NSString * _Nonnull id;
/// A reference to the createDate.
@property (nonatomic, readonly, copy) NSDate * _Nonnull createdDate;
/// A reference to tags.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull tags;
/// A reference to groups.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull groups;
- (id _Nullable)objectForKeyedSubscript:(NSString * _Nonnull)name SWIFT_WARN_UNUSED_RESULT;
- (void)setObject:(id _Nullable)value forKeyedSubscript:(NSString * _Nonnull)name;
/// A reference to the properties Dictionary.
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull properties;
/// Retrieves all the Actions that are given.
/// \param types An Array of Strings.
///
///
/// returns:
/// An Array of Actions.
- (NSArray<Action *> * _Nonnull)actionWithTypes:(NSArray<NSString *> * _Nonnull)types SWIFT_WARN_UNUSED_RESULT;
/// A reference to all the Actions that the Entity is a part of.
@property (nonatomic, readonly, copy) NSArray<Action *> * _Nonnull actions;
/// An Array of Actions the Entity belongs to when it’s part of the
/// subject set.
@property (nonatomic, readonly, copy) NSArray<Action *> * _Nonnull actionsWhenSubject;
/// An Array of Actions the Entity belongs to when it’s part of the
/// object set.
@property (nonatomic, readonly, copy) NSArray<Action *> * _Nonnull actionsWhenObject;
/// Retrieves all the Relationships that are given.
/// \param types An Array of Strings.
///
///
/// returns:
/// An Array of Relationships.
- (NSArray<Relationship *> * _Nonnull)relationshipWithTypes:(NSArray<NSString *> * _Nonnull)types SWIFT_WARN_UNUSED_RESULT;
/// A reference to all the Relationships that the Entity is a part of.
@property (nonatomic, readonly, copy) NSArray<Relationship *> * _Nonnull relationships;
/// An Array of Relationships the Entity belongs to when it’s part of the
/// subject set.
@property (nonatomic, readonly, copy) NSArray<Relationship *> * _Nonnull relationshipsWhenSubject;
/// An Array of Relationships the Entity belongs to when it’s part of the
/// object set.
@property (nonatomic, readonly, copy) NSArray<Relationship *> * _Nonnull relationshipsWhenObject;
/// Initializer that accepts a type and graph. The graph
/// indicates which graph to save to.
/// \param type A reference to a type.
///
/// \param graph A reference to a Graph instance.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type graph:(Graph * _Nonnull)graph;
/// Initializer that accepts a type value.
/// \param type A reference to a type.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type;
/// Checks equality between Entities.
/// \param object A reference to an object to test
/// equality against.
///
///
/// returns:
/// A boolean of the result, true if equal, false
/// otherwise.
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
/// Adds given tags to an Entity.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)addWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Checks if the Entity has the given tags.
/// \param tags An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given tags, false otherwise.
- (BOOL)hasWithTags:(NSArray<NSString *> * _Nonnull)tags SWIFT_WARN_UNUSED_RESULT;
/// Removes given tags from an Entity.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)removeWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given tags to an Entity or removes them, based on their
/// previous state.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)toggleWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given groups to an Entity.
/// \param to groups An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)addTo:(NSArray<NSString *> * _Nonnull)groups;
/// Checks if the Entity has a the given tags.
/// \param of groups An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given groups, false otherwise.
- (BOOL)memberOf:(NSArray<NSString *> * _Nonnull)groups SWIFT_WARN_UNUSED_RESULT;
/// Removes given groups from an Entity.
/// \param from groups An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)removeFrom:(NSArray<NSString *> * _Nonnull)groups;
/// Adds given groups to an Entity or removes them, based on their
/// previous state.
/// \param groups An Array of Strings.
///
///
/// returns:
/// The Entity.
- (Entity * _Nonnull)toggleWithGroups:(NSArray<NSString *> * _Nonnull)groups;
/// Sets the Entity as the subject of the Relationship.
/// \param relationship type A String.
///
///
/// returns:
/// A Relationship.
- (Relationship * _Nonnull)isWithRelationship:(NSString * _Nonnull)type;
/// Sets the Entity as to the subjects set of an Action.
/// \param action type A String.
///
///
/// returns:
/// A Action.
- (Action * _Nonnull)willWithAction:(NSString * _Nonnull)type;
/// Sets the Entity as to the subjects set of an Action.
/// \param action type A String.
///
///
/// returns:
/// A Action.
- (Action * _Nonnull)didWithAction:(NSString * _Nonnull)type;
/// Marks the Entity for deletion.
- (void)delete;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end

@class NSManagedObjectContext;
@protocol GraphDelegate;

SWIFT_CLASS_NAMED("Graph")
@interface Graph : NSObject
/// Graph rouute/
@property (nonatomic, readonly, copy) NSString * _Nonnull route;
/// Graph name.
@property (nonatomic, readonly, copy) NSString * _Nonnull name;
/// Graph type.
@property (nonatomic, readonly, copy) NSString * _Nonnull type;
/// Worker managedObjectContext.
@property (nonatomic, readonly, strong) NSManagedObjectContext * _Null_unspecified managedObjectContext;
/// Number of items to return.
@property (nonatomic) NSInteger batchSize;
/// Start the return results from this offset.
@property (nonatomic) NSInteger batchOffset;
@property (nonatomic, weak) id <GraphDelegate> _Nullable delegate;
/// Initializer to named Graph with optional type and location.
/// \param name A name for the Graph.
///
/// \param type Graph type.
///
/// \param location A location for storage.
/// executed to determine if iCloud support is available or not.
///
- (nonnull instancetype)initWithName:(NSString * _Nonnull)name type:(NSString * _Nonnull)type OBJC_DESIGNATED_INITIALIZER;
/// Initializer to named Graph with optional type and location.
/// \param cloud A name for the Graph.
///
/// \param type Graph type.
///
/// \param location A location for storage.
///
/// \param completion An Optional completion block that is
/// executed to determine if iCloud support is available or not.
///
- (nonnull instancetype)initWithCloud:(NSString * _Nonnull)name completion:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion OBJC_DESIGNATED_INITIALIZER;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


@interface Graph (SWIFT_EXTENSION(Graph))
/// Performs a save.
/// \param completion An Optional completion block that is
/// executed when the save operation is completed.
///
- (void)async:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
/// Performs a synchronous save.
/// \param completion An Optional completion block that is
/// executed when the save operation is completed.
///
- (void)sync:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
/// Clears all persisted data.
/// \param completion An Optional completion block that is
/// executed when the save operation is completed.
///
- (void)clear:(void (^ _Nullable)(BOOL, NSError * _Nullable))completion;
/// Reset the storage.
- (void)reset;
@end


@interface Graph (SWIFT_EXTENSION(Graph))
@end


@interface Graph (SWIFT_EXTENSION(Graph))
@end

/// Cloud stroage transition types for when changes happen
/// to the iCloud account directly.
typedef SWIFT_ENUM_NAMED(NSInteger, GraphCloudStorageTransition, "GraphCloudStorageTransition") {
  GraphCloudStorageTransitionAccountAdded = 0,
  GraphCloudStorageTransitionAccountRemoved = 1,
  GraphCloudStorageTransitionContentRemoved = 2,
  GraphCloudStorageTransitionInitialImportCompleted = 3,
};


SWIFT_PROTOCOL_NAMED("GraphDelegate")
@protocol GraphDelegate
@optional
/// A delegation method that is executed when a graph instance
/// will prepare cloud storage.
/// \param graph A Graph instance.
///
/// \param transition A GraphCloudStorageTransition value.
///
- (void)graphWillPrepareCloudStorageWithGraph:(Graph * _Nonnull)graph transition:(enum GraphCloudStorageTransition)transition;
/// A delegation method that is executed when a graph instance
/// did prepare cloud storage.
/// \param graph A Graph instance.
///
- (void)graphDidPrepareCloudStorageWithGraph:(Graph * _Nonnull)graph;
/// A delegation method that is executed when a graph instance
/// will update from cloud storage.
/// \param graph A Graph instance.
///
- (void)graphWillUpdateFromCloudStorageWithGraph:(Graph * _Nonnull)graph;
/// A delegation method that is executed when a graph instance
/// did update from cloud storage.
/// \param graph A Graph instance.
///
- (void)graphDidUpdateFromCloudStorageWithGraph:(Graph * _Nonnull)graph;
@end

typedef SWIFT_ENUM_NAMED(NSInteger, GraphSource, "GraphSource") {
  GraphSourceCloud = 0,
  GraphSourceLocal = 1,
};



SWIFT_CLASS_NAMED("Relationship")
@interface Relationship : Node
@property (nonatomic, readonly, copy) NSString * _Nonnull description;
/// A reference to the type.
@property (nonatomic, readonly, copy) NSString * _Nonnull type;
/// A reference to the hash.
@property (nonatomic, readonly) NSUInteger hash;
/// A reference to the hashValue.
@property (nonatomic, readonly) NSInteger hashValue;
/// A reference to the ID.
@property (nonatomic, readonly, copy) NSString * _Nonnull id;
/// A reference to the createDate.
@property (nonatomic, readonly, copy) NSDate * _Nonnull createdDate;
/// A reference to tags.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull tags;
/// A reference to groups.
@property (nonatomic, readonly, copy) NSArray<NSString *> * _Nonnull groups;
- (id _Nullable)objectForKeyedSubscript:(NSString * _Nonnull)name SWIFT_WARN_UNUSED_RESULT;
- (void)setObject:(id _Nullable)value forKeyedSubscript:(NSString * _Nonnull)name;
/// A reference to the properties Dictionary.
@property (nonatomic, readonly, copy) NSDictionary<NSString *, id> * _Nonnull properties;
/// A reference to the subject Entity.
@property (nonatomic, strong) Entity * _Nullable subject;
/// A reference to the object Entity.
@property (nonatomic, strong) Entity * _Nullable object;
/// Initializer that accepts a type and graph. The graph
/// indicates which graph to save to.
/// \param type A reference to a type.
///
/// \param graph A reference to a Graph instance.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type graph:(Graph * _Nonnull)graph;
/// Initializer that accepts a type value.
/// \param type A reference to a type.
///
- (nonnull instancetype)initWithType:(NSString * _Nonnull)type;
/// Checks equality between Entities.
/// \param object A reference to an object to test
/// equality against.
///
///
/// returns:
/// A boolean of the result, true if equal, false
/// otherwise.
- (BOOL)isEqual:(id _Nullable)object SWIFT_WARN_UNUSED_RESULT;
/// Adds given tags to a Relationship.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)addWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Checks if the Relationship has the given tags.
/// \param tags An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given tags, false otherwise.
- (BOOL)hasWithTags:(NSArray<NSString *> * _Nonnull)tags SWIFT_WARN_UNUSED_RESULT;
/// Removes given tags from a Relationship.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)removeWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given tags to a Relationship or removes them, based on their
/// previous state.
/// \param tags An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)toggleWithTags:(NSArray<NSString *> * _Nonnull)tags;
/// Adds given groups to a Relationship.
/// \param to groups An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)addTo:(NSArray<NSString *> * _Nonnull)groups;
/// Checks if the Relationship has a the given tags.
/// \param of groups An Array of Strings.
///
///
/// returns:
/// A boolean of the result, true if has the
/// given groups, false otherwise.
- (BOOL)memberOf:(NSArray<NSString *> * _Nonnull)groups SWIFT_WARN_UNUSED_RESULT;
/// Removes given groups from a Relationship.
/// \param from groups An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)removeFrom:(NSArray<NSString *> * _Nonnull)groups;
/// Adds given groups to a Relationship or removes them, based on their
/// previous state.
/// \param groups An Array of Strings.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)toggleWithGroups:(NSArray<NSString *> * _Nonnull)groups;
/// Sets the object of the Relationship.
/// \param object An Entity.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)ofObject:(Entity * _Nonnull)object;
/// Sets the object of the Relationship.
/// \param object An Entity.
///
///
/// returns:
/// The Relationship.
- (Relationship * _Nonnull)inObject:(Entity * _Nonnull)object;
/// Marks the Relationship for deletion.
- (void)delete;
- (nonnull instancetype)init SWIFT_UNAVAILABLE;
@end


SWIFT_PROTOCOL_NAMED("WatchDelegate")
@protocol WatchDelegate
@end


SWIFT_PROTOCOL_NAMED("WatchActionDelegate")
@protocol WatchActionDelegate <WatchDelegate>
@optional
/// A delegation method that is executed when an Action is inserted.
/// \param graph A Graph instance.
///
/// \param inserted action An Action instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph inserted:(Action * _Nonnull)action source:(enum GraphSource)source;
/// A delegation method that is executed when an Action is deleted.
/// \param graph A Graph instance.
///
/// \param deleted action An Action instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph deleted:(Action * _Nonnull)action source:(enum GraphSource)source;
/// A delegation method that is executed when an Action added a property and value.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param added property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action added:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Action updated a property and value.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param updated property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action updated:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Action removed a property and value.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param removed property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action removed:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Action added a tag.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param added tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action added:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when an Action removed a tag.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param removed tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action removed:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when an Action was added to a group.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param addedTo group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action addedTo:(NSString * _Nonnull)group source:(enum GraphSource)source;
/// A delegation method that is executed when an Action was removed from a group.
/// \param graph A Graph instance.
///
/// \param action An Action instance.
///
/// \param removedFrom group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph action:(Action * _Nonnull)action removedFrom:(NSString * _Nonnull)group source:(enum GraphSource)source;
@end



SWIFT_PROTOCOL_NAMED("WatchEntityDelegate")
@protocol WatchEntityDelegate <WatchDelegate>
@optional
/// A delegation method that is executed when an Entity is inserted.
/// \param graph A Graph instance.
///
/// \param inserted entity An Entity instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph inserted:(Entity * _Nonnull)entity source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity is deleted.
/// \param graph A Graph instance.
///
/// \param deleted entity An Entity instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph deleted:(Entity * _Nonnull)entity source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity added a property and value.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param added property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity added:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity updated a property and value.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param updated property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity updated:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity removed a property and value.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param removed property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity removed:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity added a tag.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param added tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity added:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity removed a tag.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param removed tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity removed:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity was added to a group.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param addedTo group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity addedTo:(NSString * _Nonnull)group source:(enum GraphSource)source;
/// A delegation method that is executed when an Entity was removed from a group.
/// \param graph A Graph instance.
///
/// \param entity An Entity instance.
///
/// \param removedFrom group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph entity:(Entity * _Nonnull)entity removedFrom:(NSString * _Nonnull)group source:(enum GraphSource)source;
@end


SWIFT_PROTOCOL_NAMED("WatchRelationshipDelegate")
@protocol WatchRelationshipDelegate <WatchDelegate>
@optional
/// A delegation method that is executed when a Relationship is inserted.
/// \param graph A Graph instance.
///
/// \param inserted relationship A Relationship instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph inserted:(Relationship * _Nonnull)relationship source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship is updated.
/// \param graph A Graph instance.
///
/// \param updated relationship A Relationship instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph updated:(Relationship * _Nonnull)relationship source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship is deleted.
/// \param graph A Graph instance.
///
/// \param deleted relationship A Relationship instance.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph deleted:(Relationship * _Nonnull)relationship source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship added a property and value.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param added property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship added:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship updated a property and value.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param updated property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship updated:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship removed a property and value.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param removed property A String.
///
/// \param with value Any object.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship removed:(NSString * _Nonnull)property with:(id _Nonnull)value source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship added a tag.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param added tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship added:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship removed a tag.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param removed tag A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship removed:(NSString * _Nonnull)tag source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship was added to a group.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param addedTo group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship addedTo:(NSString * _Nonnull)group source:(enum GraphSource)source;
/// A delegation method that is executed when a Relationship was removed from a group.
/// \param graph A Graph instance.
///
/// \param relationship A Relationship instance.
///
/// \param removedFrom group A String.
///
/// \param source A GraphSource value.
///
- (void)watchWithGraph:(Graph * _Nonnull)graph relationship:(Relationship * _Nonnull)relationship removedFrom:(NSString * _Nonnull)group source:(enum GraphSource)source;
@end

#pragma clang diagnostic pop