#include <linux/module.h>
#include <linux/kernel.h>
#include <linux/seq_file.h>
#include <linux/proc_fs.h>
#include <linux/init.h>
#include <linux/interrupt.h>

#define HANDLEDIRQ 1

MODULE_AUTHOR("Alexander Chaushev");
MODULE_LICENSE("GPL");

static int irq = HANDLEDIRQ;
static int irq_call_count = 0;
static int dev_id;
char tasklet_data[] = "tasklet_function was called";

static struct proc_dir_entry *proc_file;

void tasklet_function(unsigned long data);

DECLARE_TASKLET(tasklet, tasklet_function, (unsigned long)&tasklet_data);

void tasklet_function(unsigned long data)
{
 
    printk(KERN_INFO "[tasklet_module] Tasklet: { state: %ld, count: %d, data: %s }", 
        tasklet.state, atomic_read(&tasklet.count), (char *)tasklet.data);
}

static irqreturn_t interrupt_handler(int irq, void *dev_id)
{
    if (irq == HANDLEDIRQ)
    {
        irq_call_count++;
        printk(KERN_INFO "[tasklet_module] irq call count = %d\n", irq_call_count);
        tasklet_schedule(&tasklet);
        return IRQ_HANDLED;
    }
    else
    {
        return IRQ_NONE;
    }
}

static int tasklet_show(struct seq_file *m, void *v) {
    printk(KERN_INFO "[tasklet_module] called tasklet show.\n");
    seq_printf(m, "Tasklet: { state: %ld, count: %d, data: %s }", 
        tasklet.state, atomic_read(&tasklet.count), (char *)tasklet.data);
        return 0;
}

static int tasklet_open( struct inode *inode, struct file *file) {
    printk(KERN_INFO "[tasklet_module] called taskled open.\n");
    return single_open(file, tasklet_show, NULL);
}

static int tasklet_release(struct inode *inode, struct file *file) {
    printk(KERN_INFO "[tasklet_module] called taskled release.\n");
    return single_release(inode, file);
}

static struct file_operations tasklet_ops = 
{
    //.owner = THIS_MODULE,
    .open = tasklet_open,
    .release = tasklet_release,
    .read = seq_read
};

static int __init tasklet_module_init(void)
{
    proc_file = proc_create("tasklett", S_IRUGO, NULL, &tasklet_ops);
    if (!proc_file) {
        printk(KERN_ERR "[tasklet_module]  error while creating seq file\n");
        return -1;
    }

    int ret = request_irq(irq, interrupt_handler, IRQF_SHARED, "tasklet_interrupt_handler", &dev_id);

    if (ret)
    {
        printk(KERN_ERR "[tasklet_module] error while handle irq\n");
        return -1;
    }

    printk(KERN_INFO "[tasklet_module] success load\n");
    return 0;
}

static void __exit tasklet_module_exit(void)
{
    tasklet_kill(&tasklet);
    free_irq(irq, &dev_id);
    printk(KERN_INFO "[tasklet_module] unload module\n");
}

module_init(tasklet_module_init);
module_exit(tasklet_module_exit);
